import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginState {
  static final TextEditingController userController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  bool rememberMe;
  
  LoginState({required this.rememberMe});

  LoginState copyWith({bool? rememberMe}) {
    return LoginInitial()..rememberMe = rememberMe ?? this.rememberMe;
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
  LoginCubit() : super(LoginInitial());

  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading(rememberMe: state.rememberMe));
      // Aquí tu lógica de login
      await Future.delayed(const Duration(seconds: 2)); // Simulación de login
      emit(LoginSuccess(rememberMe: state.rememberMe));
    } catch (e) {
      emit(LoginError(message: e.toString(), rememberMe: state.rememberMe));
    }
  }
}
