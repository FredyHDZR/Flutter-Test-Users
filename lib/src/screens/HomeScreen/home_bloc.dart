import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/models/user_model.dart';
import 'package:flutter_test_users/src/routes/routes_names.dart';
import 'package:flutter_test_users/src/services/user_service.dart';
import 'package:flutter_test_users/src/utils/local_storage.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<User> users;
  HomeLoaded({required this.users});
}

class HomeLoading extends HomeState {}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getUsers();
  }

  UserService userService = UserService();

  Future<void> getUsers() async {
    emit(HomeLoading());
    var users = await userService.getUsers();
    emit(HomeLoaded(users: users));
  }

  void logout(BuildContext context) {
    LocalStorage.logoutUser();
    Navigator.pushReplacementNamed(context, RoutesNames.login);
  }
}
