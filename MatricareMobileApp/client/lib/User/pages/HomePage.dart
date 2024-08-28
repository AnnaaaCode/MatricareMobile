import 'dart:ui';
import 'package:client/User/features/Appointment.dart';
import 'package:client/User/features/Medical.dart';
import 'package:client/User/features/ResourceLibrary.dart';
import 'package:client/User/features/VirtualConsultation.dart';
import 'package:client/User/pages/BellyTalk.dart';
import 'package:client/User/pages/NotificationPage.dart';
import 'package:client/User/pages/UserProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../drawer/custom_drawer.dart'; 

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  final String username = 'Ella Cruz';

  final List<String> articleLinks = [
    'https://magazine.medlineplus.gov/topic/pregnancy',
    'https://example.com/article2',  
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: CustomDrawer(username: username), // Use the custom drawer
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                ),
              ),
            ),
            Positioned(
              top: 40.0,
              left: 20.0,
              child: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    size: 30,
                    color: Color(0xFF9a6cb4),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40.0,
              right: 20.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                },
                child: Icon(
                  Icons.notifications,
                  size: 30,
                  color: Color(0xFF9a6cb4),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 90.0, left: 20.0, right: 20.0, bottom: 20.0), // Top margin here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, $username!', 
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),            
                  SizedBox(height: 10), 
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 233, 233).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        SizedBox(width: 10.0), // Add space between the icon and the text field
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,  // This makes the container take up the full width of the screen
                    height: 115.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/one.jpg'),
                        fit: BoxFit.cover,  // Ensures the image covers the entire container
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 15), // Adjust the left margin here
                          child: Text(
                            'Welcome to Matricare!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0), // Adjust the left margin here
                          child: Text(
                            'Let\'s schedule your \nappointment for ease',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0), // Additional space
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // Aligns the text and Row to the left
                    children: [
                      Text(
                        'Categories',  // The text to be displayed before the Row
                        style: TextStyle(
                          fontSize: 18.0,  // Adjust the font size as needed
                          fontWeight: FontWeight.bold,  // Optional: make the text bold
                        ),
                      ),
                      SizedBox(height: 10.0),  // Add some space between the text and the icons
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Medical()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: _buildSquareIcon(Icons.medical_information_outlined, 'Medical', textSize: 14),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VirtualConsultation()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: _buildSquareIcon(Icons.video_camera_back_outlined, 'Consultation', textSize: 14),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BellyTalk()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: _buildSquareIcon(Icons.comment_outlined, 'Belly Talk', textSize: 14),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Appointment()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: _buildSquareIcon(Icons.calendar_month_outlined, 'Appointment', textSize: 14),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfilePage()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                child: _buildSquareIcon(Icons.person_outline, 'Profile', textSize: 14),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: _buildSquareIcon(Icons.library_books_outlined, 'Library', textSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),  // Space after the row
                    ],
                  ),
                  // New section for four containers
                  SizedBox(height: 20.0), // Space before the new section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildContainer('Container 1', Colors.black),
                      _buildContainer('Container 2', Color(0xFFD1C4E9).withOpacity(0.6)),
                    ],
                  ),
                  SizedBox(height: 10.0), // Space between the rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildContainer1('Container 3', Color(0xFFD1C4E9).withOpacity(0.6)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareIcon(IconData iconData, String label, {double textSize = 40.0}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color(0xFFD1C4E9).withOpacity(0.6), // Background color
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
          ),
          child: Icon(iconData, color: const Color.fromARGB(255, 0, 0, 0), size: 35.0), // Icon
        ),
        SizedBox(height: 5.0), // Space between icon and text
        Text(
          label,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.normal,
            color: const Color.fromARGB(255, 0, 0, 0), // Text color
          ),
        ),
      ],
    );
  }

  Widget _buildContainer(String text, Color color) {
    return Container(
      width: 170, // Adjust the width as needed
      height: 140, // Height of the container
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
    Widget _buildContainer1(String text, Color color) {
    return Container(
      width: 350, // Adjust the width as needed
      height: 140, // Height of the container
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}


