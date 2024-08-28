import 'package:client/User/features/MedicalRecords/LaboratoryResults.dart';
import 'package:client/User/features/MedicalRecords/MedicalHistory.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(Medical());
}

class Medical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 2),
                      child: Container(
                        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50.0,
                    left: 10.0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 0, 0, 0)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Positioned(
                    top: 57.0,
                    left: 40.0,
                    right: 0.0,
                    child: Center(
                      child: Text(
                        'Medical Records History',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                  // First vertical container
                  Positioned(
                    top: 180.0, // Adjusted top position
                    left: 37.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Medicalhistory()));
                      },
                      child: Container(
                        width: 320.0, // Adjusted width
                        height: 220.0, // Adjusted height
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0), // Adjusted border radius
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Ensures image respects the border radius
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.7, // Adjusted opacity
                                child: Image.asset(
                                  'images/imgmedical.jpg',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                top: 10.0, // Adjusted position of the icon
                                left: 10.0,
                                child: Icon(
                                  Icons.history,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                              ),
                              Positioned(
                                bottom: 20.0, // Adjusted position of the text
                                left: 20.0,
                                child: Container(
                                  padding: EdgeInsets.all(8.0), // Add some padding
                                  color: Colors.red, // Red background
                                  child: Text(
                                    'Medical History',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white, // Change text color to white for contrast
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Second vertical container
                  Positioned(
                    top: 450.0, // Adjusted top position
                    left: 37.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LaboratoryResults()));
                      },
                      child: Container(
                        width: 320.0, // Adjusted width
                        height: 220.0, // Adjusted height
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0), // Adjusted border radius
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0), // Ensures image respects the border radius
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.7, // Adjusted opacity
                                child: Image.asset(
                                  'images/imgmedical.jpg',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                top: 10.0, // Adjusted position of the icon
                                left: 10.0,
                                child: Opacity(
                                  opacity: 0.7, // Adjusted opacity
                                  child: Icon(Icons.assignment, color: Colors.black, size: 30.0),
                                ),
                              ),
                              Positioned(
                                bottom: 20.0, // Adjusted position of the text
                                left: 20.0,
                                child: Container(
                                  padding: EdgeInsets.all(8.0), // Add some padding
                                  color: Colors.red, // Red background
                                  child: Text(
                                    'Laboratory Results',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white, // Change text color to white for contrast
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
