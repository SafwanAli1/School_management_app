import 'package:flutter/material.dart';
import 'package:school_management_system/const/button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        // Handle successful login, e.g., navigate to another screen
        print('Login successful: ${responseData['token']}');
      } else {
        // Handle login failure
        print('Login failed: ${response.body}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in Now'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // Added SingleChildScrollView for better handling on smaller screens
        child: Padding(
          padding: const EdgeInsets.only(top: 150,left: 40,right: 40),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 150,
              ), // Replace with actual image
              SizedBox(height: 40),
              Text(
                'Welcome,',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Glad to See You',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.check,
                    color: tropicalIndigo,
                  ),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.lock,
                    color: tropicalIndigo,
                  ),
                  labelText: 'Password',
                ),
                obscureText: true, // Set obscureText for password
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  login(emailController.text.toString(),passwordController.text.toString());
                },
                isElevated: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
