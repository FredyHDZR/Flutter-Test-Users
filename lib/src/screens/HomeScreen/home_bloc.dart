import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_users/src/models/user_model.dart';
import 'package:flutter_test_users/src/services/user_service.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<User> users;
  HomeLoaded({required this.users});
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getUsers();
  }

  UserService userService = UserService();

  Future<void> getUsers() async {
    print('getUsers');
    var users = await userService.getUsers();
    emit(HomeLoaded(users: users));
  }
}
