import 'package:flutter_app_clone/models/user.dart';
import 'package:flutter_app_clone/utils/constants.dart';
import 'package:flutter_app_clone/utils/routes.dart';

class AuthService {
  Future<User> login(String email, String password) async {
    // TODO: Implement login logic using API service
  }

  Future<User> register(String name, String email, String password) async {
    // TODO: Implement register logic using API service
  }

  Future<void> logout() async {
    // TODO: Implement logout logic using API service
  }

  Future<User> getUserProfile() async {
    // TODO: Implement get user profile logic using API service
  }

  Future<void> updateUserProfile(User user) async {
    // TODO: Implement update user profile logic using API service
  }
}

final authService = AuthService();