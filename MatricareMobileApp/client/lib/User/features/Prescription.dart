import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(Prescription());
}

class Prescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.80, // Adjust the opacity as needed (0.0 to 1.0)
              child: Image.asset(
                'images/pic2.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 2), // Adjust the blur to create an inner shadow effect
                child: Container(
                  color: Color(0xFFC98F8F).withOpacity(0.5), // Adjust the color and opacity to create the shadow effect
                ),
              ),
            ),
            Positioned(
              top: 50.0, // Adjust as needed
              left: 10.0, // Adjust as needed
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop(); // Navigate back to the previous route
                },
              ),
            ),
            Positioned(
              top: 57.0, // Adjust as needed
              left: 40.0,
              right: 0.0,
              child: Center(
                child: Text(
                  'Prescription',
                  style: TextStyle(
                     fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
