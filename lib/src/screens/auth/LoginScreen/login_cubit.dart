// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/routes/routes_names.dart';
import 'package:flutter_test_users/src/utils/functions.dart';
import 'package:flutter_test_users/src/utils/local_storage.dart';

abstract class LoginState {
  static final TextEditingController userController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  bool enabledButton;
  bool rememberMe;
  String? userError;
  String? passwordError;

  LoginState({
    required this.rememberMe,
    this.userError,
    this.passwordError,
    this.enabledButton = false,
  });

  LoginState copyWith({
    bool? rememberMe,
    String? userError,
    String? passwordError,
    bool? enabledButton,
  }) {
    return LoginInitial()
      ..rememberMe = rememberMe ?? this.rememberMe
      ..userError = userError
      ..passwordError = passwordError
      ..enabledButton = (enabledButton != null && enabledButton) ||
          (userError == null &&
              passwordError == null &&
              LoginState.userController.text.isNotEmpty &&
              LoginState.passwordController.text.isNotEmpty);
  }
}

class LoginInitial extends LoginState {
  LoginInitial() : super(rememberMe: false);
}

class LoginLoading extends LoginState {
  LoginLoading({required super.rememberMe});
}

class LoginSuccess extends LoginState {
  LoginSuccess({required super.rememberMe});
}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message, required super.rememberMe});
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial()) {
    LocalStorage.saveUser('admin', '123456');
    getUserPersistant();
  }

  Future<void> getUserPersistant() async {
    var userPersistant = await LocalStorage.getUserPersistant();
    if (userPersistant != null) {
      LoginState.userController.text = userPersistant['user'];
      LoginState.passwordController.text = userPersistant['password'];
      emit(state.copyWith(enabledButton: true));
    }
  }

  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  Future<void> login(BuildContext context) async {
    try {
      emit(LoginLoading(rememberMe: state.rememberMe));
      var resp = await LocalStorage.getUser(LoginState.userController.text);
      if (resp != null) {
        if (resp['password'] == LoginState.passwordController.text) {
          if (state.rememberMe) {
            LocalStorage.saveUserPersistant(LoginState.userController.text,
                LoginState.passwordController.text);
          }
          var token = generateRandomToken(32);
          await LocalStorage.loginUser(token);
          Navigator.pushReplacementNamed(context, RoutesNames.home);
        } else {
          emit(state.copyWith(passwordError: 'Wrong password'));
        }
      } else {
        emit(state.copyWith(userError: 'User not found'));
      }
    } catch (e) {
      emit(LoginError(message: e.toString(), rememberMe: state.rememberMe));
    }
  }

  void validateUser(String user) {
    if (user.isEmpty) {
      emit(state.copyWith(
          userError: 'User required', passwordError: state.passwordError));
    } else {
      emit(state.copyWith(userError: null, passwordError: state.passwordError));
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      emit(state.copyWith(
          passwordError: 'Password required', userError: state.userError));
    } else {
      emit(state.copyWith(passwordError: null, userError: state.userError));
    }
  }
}
