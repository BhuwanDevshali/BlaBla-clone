import 'package:flutter/material.dart';

class Constants {
  static const String appName = "Bla Bla Car Clone";

  // API Endpoints
  static const String apiBaseUrl = "http://localhost:3000/api";
  static const String loginEndpoint = "$apiBaseUrl/auth/login";
  static const String registerEndpoint = "$apiBaseUrl/auth/register";
  static const String profileEndpoint = "$apiBaseUrl/user/profile";

  // Colors
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.orange;

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // Routes
  static const String homeRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String profileRoute = "/profile";
}