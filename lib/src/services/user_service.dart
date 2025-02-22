import 'package:dio/dio.dart';
import 'package:flutter_test_users/src/models/user_model.dart';

class UserService {
  Dio dio = Dio();

  Future<List<User>> getUsers() async {
    var response = await dio.get('https://jsonplaceholder.typicode.com/users');
    return response.data.map<User>((user) => User.fromJson(user)).toList();
  }
}