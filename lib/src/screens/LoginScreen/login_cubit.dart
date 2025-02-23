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
  bool rememberMe;
  String? userError;
  String? passwordError;

  LoginState({
    required this.rememberMe,
    this.userError,
    this.passwordError,
  });

  LoginState copyWith({
    bool? rememberMe,
    String? userError,
    String? passwordError,
  }) {
    return LoginInitial()
      ..rememberMe = rememberMe ?? this.rememberMe
      ..userError = userError ?? this.userError
      ..passwordError = passwordError ?? this.passwordError;
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
            var token = generateRandomToken(32);
            LocalStorage.loginUser(token);
          }
          Navigator.pushReplacementNamed(context, RoutesNames.home);
        } else {
          emit(state.copyWith(passwordError: 'Contraseña incorrecta'));
        }
      } else {
        emit(state.copyWith(userError: 'Usuario no encontrado'));
      }
    } catch (e) {
      emit(LoginError(message: e.toString(), rememberMe: state.rememberMe));
    }
  }

  void validateUser(String user) {
    if (user.isEmpty) {
      emit(state.copyWith(userError: 'Usuario requerido'));
    } else {
      emit(state.copyWith(userError: ''));
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      emit(state.copyWith(passwordError: 'Contraseña requerida'));
    } else {
      emit(state.copyWith(passwordError: ''));
    }
  }
}
