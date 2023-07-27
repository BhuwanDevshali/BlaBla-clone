import 'package:flutter/material.dart';
import 'package:flutter_app_clone/models/user.dart';
import 'package:flutter_app_clone/services/auth_service.dart';
import 'package:flutter_app_clone/utils/constants.dart';
import 'package:flutter_app_clone/widgets/custom_button.dart';
import 'package:flutter_app_clone/widgets/custom_textfield.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  label: 'Name',
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  label: 'Email',
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  label: 'Password',
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  label: 'Confirm Password',
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _confirmPassword = value;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                CustomButton(
                  text: 'Update Profile',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      User user = User(
                        name: _name,
                        email: _email,
                        password: _password,
                      );
                      _authService.updateProfile(user);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}