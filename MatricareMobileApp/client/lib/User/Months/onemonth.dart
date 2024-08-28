import 'dart:ui'; 
import 'package:client/User/pages/FetalsGrowth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/User/pages/HomePage.dart';

class onemonth extends StatefulWidget {
  @override
  _Week1State createState() => _Week1State();
}

class _Week1State extends State<onemonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFD1C4E9).withOpacity(0.6),  // Background color added here
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.44, // Adjust the height as needed
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {},
                ),
                items: [
                  _buildCarouselItem('images/months/onemonth1.png'),
                  _buildCarouselItem('images/months/onemonth2.png'),
                  _buildCarouselItem('images/months/onemonth3.png'),
                ],
              ),
            ),
          Positioned(
            top: 50.0,
            left: 20.0,
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               color: Color(0xFFD1C4E9).withOpacity(0.6), // Light white background
              ),
              child: Transform.translate(
                offset: Offset(5, 0), // Adjust this value to move the icon
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 0, 0, 0)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GetStartedFetalsGrowth()));
                  },
                ),
              ),
            ),
          ),
       Positioned(
  top: MediaQuery.of(context).size.height * 0.40,
  left: 0,
  right: 0,
  bottom: 0,
  child: ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0),
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'ONE MONTH',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          // Text for the current text slide
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                'In the first month, your baby is a tiny poppy seed with a beating heart. The foundation for their brain and spinal cord is forming. \n  \n  The first month is crucial as the basic structure of the baby\'s body is forming. This is a time for you to take extra care of yourself, both physically and emotionally. \n \n Remember to consult with your healthcare provider to ensure you are getting the right nutrients and to address any concerns you might have during this early stage of pregnancy.',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
),Positioned(
  bottom: 20,
  left: 0, // Set left to 0 to use Center widget
  right: 0, // Set right to 0 to use Center widget
  child: Center( // Wrap with Center widget
    child: SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF9a6cb4)),
          overlayColor: MaterialStateProperty.all<Color>(Color(0xFFF0E0E0).withOpacity(0.2)),
          mouseCursor: MaterialStateProperty.all<MouseCursor>(SystemMouseCursors.click),
        ),
        child: Text(
          'EXPLORE',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
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


  Widget _buildCarouselItem(String imagePath) {
    return Stack(
      children: [
        Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: 400.0),
      ],
    );
  }
}
