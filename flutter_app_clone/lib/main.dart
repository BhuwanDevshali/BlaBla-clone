import 'package:flutter/material.dart';
import 'package:flutter_app_clone/utils/routes.dart';
import 'package:flutter_app_clone/screens/home_screen.dart';
import 'package:flutter_app_clone/screens/login_screen.dart';
import 'package:flutter_app_clone/screens/register_screen.dart';
import 'package:flutter_app_clone/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bla Bla Car Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.loginRoute,
      routes: {
        Routes.homeRoute: (context) => HomeScreen(),
        Routes.loginRoute: (context) => LoginScreen(),
        Routes.registerRoute: (context) => RegisterScreen(),
        Routes.profileRoute: (context) => ProfileScreen(),
      },
    );
  }
}