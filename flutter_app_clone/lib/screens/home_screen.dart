import 'package:flutter/material.dart';
import 'package:flutter_app_clone/models/user.dart';
import 'package:flutter_app_clone/services/api_service.dart';
import 'package:flutter_app_clone/utils/constants.dart';
import 'package:flutter_app_clone/widgets/custom_button.dart';
import 'package:flutter_app_clone/widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${widget.user.name}!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Logout',
              onPressed: () {
                _apiService.logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}