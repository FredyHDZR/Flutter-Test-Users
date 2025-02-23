import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveUser(String user, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'user$user', jsonEncode({'user': user, 'password': password}));
  }

  static Future<Map<String, dynamic>?> getUser(String user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('user$user');
    return userJson != null ? jsonDecode(userJson) : userJson;
  }

  static Future<void> loginUser(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
