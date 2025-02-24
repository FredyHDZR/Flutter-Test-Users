import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/utils/local_storage.dart';

abstract class CreateAccountState {
  static final TextEditingController userController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController confirmpasswordController =
      TextEditingController();
  bool enabledButton;
  String? userError;
  String? passwordError;
  String? confirmPasswordError;

  CreateAccountState({
    this.userError,
    this.passwordError,
    this.confirmPasswordError,
    this.enabledButton = false,
  });

  CreateAccountState copyWith({
    String? userError,
    String? passwordError,
    String? confirmPasswordError,
    bool? enabledButton,
  }) {
    return CreateAccountInitial()
      ..userError = userError
      ..passwordError = passwordError
      ..confirmPasswordError = confirmPasswordError
      ..enabledButton = (enabledButton != null && enabledButton) ||
          (userError == null &&
              passwordError == null &&
              confirmPasswordError == null &&
              CreateAccountState.userController.text.isNotEmpty &&
              CreateAccountState.passwordController.text.isNotEmpty &&
              CreateAccountState.confirmpasswordController.text.isNotEmpty);
  }
}

class CreateAccountInitial extends CreateAccountState {}

class CreateAccountLoading extends CreateAccountState {}

class CreateAccountSuccess extends CreateAccountState {}

class CreateAccountError extends CreateAccountState {}

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitial());

  void createAccount(BuildContext context) async {
    emit(CreateAccountLoading());
    var resp = await LocalStorage.saveUser(CreateAccountState.userController.text,
        CreateAccountState.passwordController.text);
    if (resp) {
      emit(CreateAccountSuccess());
      closeControllers();
      Navigator.pop(context);
    } else {
      emit(CreateAccountError());
    }
  }

  void validateUser(String user) {
    if (user.isEmpty) {
      emit(state.copyWith(
          userError: 'User required',
          passwordError: state.passwordError,
          confirmPasswordError: state.confirmPasswordError));
    } else {
      emit(state.copyWith(
          userError: null,
          passwordError: state.passwordError,
          confirmPasswordError: state.confirmPasswordError));
    }
  }

  void validatePassword(String password) {
    if (password.isEmpty) {
      emit(state.copyWith(
          passwordError: 'Password required',
          userError: state.userError,
          confirmPasswordError: state.confirmPasswordError));
    } else {
      emit(state.copyWith(
          passwordError: null,
          userError: state.userError,
          confirmPasswordError: state.confirmPasswordError));
    }
    validateConfirmPassword(CreateAccountState.confirmpasswordController.text);
  }

  void validateConfirmPassword(String confirmPassword) {
    if (confirmPassword.isEmpty) {
      emit(state.copyWith(
          confirmPasswordError: 'Confirm password required',
          userError: state.userError,
          passwordError: state.passwordError));
    } else if (confirmPassword != CreateAccountState.passwordController.text) {
      emit(state.copyWith(
          confirmPasswordError: 'Passwords do not match',
          userError: state.userError,
          passwordError: state.passwordError));
    } else {
      emit(state.copyWith(
          confirmPasswordError: null,
          userError: state.userError,
          passwordError: state.passwordError));
    }
  }

  void closeControllers() {
    CreateAccountState.userController.clear();
    CreateAccountState.passwordController.clear();
    CreateAccountState.confirmpasswordController.clear();
  }
}
