import 'package:flutter/material.dart';
import 'package:client/User/pages/ForgotPassword.dart';
import 'package:client/User/pages/LandingPage.dart' as landing;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MatriCare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Set the initial route to '/' or your landing page
      routes: {
        '/': (context) => landing.LandingPage(), // Your landing page or initial route
        '/forgot_password': (context) => ForgotPassword(), // Forgot password page route
      },
    );
  }
}
