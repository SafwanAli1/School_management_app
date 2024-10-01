import 'package:flutter/material.dart';
import 'package:school_management_system/const/button.dart';
import 'package:school_management_system/screens/login_screen.dart';
import 'package:school_management_system/screens/student_list.dart';
import 'package:school_management_system/screens/teacher_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: tropicalIndigo, // Tropical Indigo
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/', // The first screen to show
      routes: {
        '/': (context) => StudentList(),
        '/login': (context) => LoginScreen(),
      },
    );

  }
}
