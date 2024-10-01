import 'package:flutter/material.dart';
import 'package:school_management_system/const/button.dart';
import 'package:school_management_system/screens/login_screen.dart'; // Import the custom button

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              SizedBox(height: 40),
              Image.asset(
                  'assets/images/splash screen.png'), // Add your image asset here
              SizedBox(height: 20),
              Text(
                'All In One Solution For Early Childhood Education',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
