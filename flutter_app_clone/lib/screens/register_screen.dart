import 'package:flutter/material.dart';
import 'package:flutter_app_clone/lib/models/user.dart';
import 'package:flutter_app_clone/lib/services/auth_service.dart';
import 'package:flutter_app_clone/lib/services/api_service.dart';
import 'package:flutter_app_clone/lib/utils/constants.dart';
import 'package:flutter_app_clone/lib/utils/routes.dart';
import 'package:flutter_app_clone/lib/widgets/custom_button.dart';
import 'package:flutter_app_clone/lib/widgets/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _authService = AuthService();
  final ApiService _apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                labelText: 'Email',
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                labelText: 'Password',
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                labelText: 'Confirm Password',
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _confirmPassword = value;
                  });
                },
              ),
              SizedBox(height: 20.0),
              CustomButton(
                text: 'Register',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    if (_password == _confirmPassword) {
                      dynamic result = await _authService.registerWithEmailAndPassword(_email, _password);
                      if (result == null) {
                        setState(() {
                          _error = 'Error registering user';
                        });
                      } else {
                        User user = User(email: _email);
                        await _apiService.createUser(user);
                        Navigator.pushReplacementNamed(context, Routes.home);
                      }
                    } else {
                      setState(() {
                        _error = 'Passwords do not match';
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                _error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}