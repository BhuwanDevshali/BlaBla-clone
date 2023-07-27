import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_app_clone/lib/models/user.dart';
import 'package:flutter_app_clone/lib/utils/constants.dart';

class ApiService {
  Future<User> getUserDetails(String userId) async {
    final response = await http.get('${Constants.apiUrl}/users/$userId');
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user details');
    }
  }

  Future<List<User>> getUsers() async {
    final response = await http.get('${Constants.apiUrl}/users');
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<User> createUser(User user) async {
    final response = await http.post(
      '${Constants.apiUrl}/users',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  Future<User> updateUser(User user) async {
    final response = await http.put(
      '${Constants.apiUrl}/users/${user.id}',
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(String userId) async {
    final response = await http.delete('${Constants.apiUrl}/users/$userId');
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }
}