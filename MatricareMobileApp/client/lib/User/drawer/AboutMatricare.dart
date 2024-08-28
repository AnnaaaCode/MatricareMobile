import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(AboutMatricare());
}

class AboutMatricare extends StatelessWidget {
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
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.7), // Adjust the color and opacity to create the shadow effect
                ),
              ),
            ),
            Positioned(
              top: 50.0, // Adjust as needed
              left: 10.0, // Adjust as needed
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 0, 0, 0)),
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
                  'About Matricare',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70.0, // Adjust this value to position the logo
              left: 0.0,
              right: 0.0,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/logo1.png', // Replace with your logo asset path
                  width: 300.0, // Adjust the width as needed
                  height: 300.0, // Adjust height if needed
                  fit: BoxFit.contain, // Ensure the logo fits within the given width and height
                ),
              ),
            ),
            Positioned(
              top: 315.0, // Adjust this value to move the container up as needed
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(13.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0), // Border radius
                  ),
                  child: Text(
                    'Matricare is your trusted pregnancy support app designed to assist and guide you through every stage of your pregnancy. Our app provides features such as personalized pregnancy tracking, expert advice, health tips, and a supportive community to ensure a healthy and enjoyable pregnancy journey.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      height: 2.2,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 0, 0, 0), // Adjust text color for contrast
                    ),
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
