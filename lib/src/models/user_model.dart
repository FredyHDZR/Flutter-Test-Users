import 'package:flutter_test_users/src/models/address_model.dart';
import 'package:flutter_test_users/src/models/company_model.dart';

class User {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Company company;
  final Address address;

  User(this.username, this.address,
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.website,
      required this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['username'], Address.fromJson(json['address']),
        id: json['id'].toString(),
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company']));
  }
}
