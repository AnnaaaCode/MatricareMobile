import 'dart:ui'; // Add this import
import 'package:flutter/material.dart';
import 'package:client/User/pages/SignUpPage.dart';

void main() {
  runApp(LandingPage());
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MatriCare',
      home: Scaffold(
        backgroundColor: Colors.white, // Changed to white
        body: LandingBody(),
      ),
    );
  }
}

class LandingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.9, // Adjust the opacity here (0.0 to 1.0)
          child: Container(
            width: double.infinity, // Adjust the width as needed
            height: double.infinity, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/2.png'), // Path to the background image
                fit: BoxFit.cover, // Adjust how the image fits within the container
              ),
            ),
          ),
        ),
        Positioned(
          top: 100, // Adjust the top position as needed
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  'M A T R I C A R E',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto', // Change to your desired font family
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF9a6cb4), // Set the color to #9a6cb4
                  ),
                ),        
              ],
            ),
          ),
        ),
        // Positioned button
        Positioned(
  top: 180.0, // Adjust the position as needed
  left: 280,
  right: 0,
  child: Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xFF9a6cb4), // Inner background color
        borderRadius: BorderRadius.circular(50.0), // Rounded corners
      ),
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
          );
        },
        icon: Icon(
          Icons.arrow_forward, // Right arrow icon
          color: Colors.white,
          size: 30.0, // Adjust the size as needed
        ),
        constraints: BoxConstraints(),
      ),
    ),
  ),
),

      ],
    );
  }
}

