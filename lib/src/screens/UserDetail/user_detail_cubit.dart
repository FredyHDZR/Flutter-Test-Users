
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserDetailState {}

class UserDetailInitial extends UserDetailState {}

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit() : super(UserDetailInitial());
}
