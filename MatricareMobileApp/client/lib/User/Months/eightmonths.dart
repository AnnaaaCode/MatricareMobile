import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/User/pages/HomePage.dart';

class Eightmonths extends StatefulWidget {
  @override
  _Week8State createState() => _Week8State();
}

class _Week8State extends State<Eightmonths> {
  int _currentTextIndex = 0;

  final List<String> _textSlides = [
    'In the first month, your baby is a tiny poppy seed with a beating heart. The foundation for their brain and spinal cord is forming.',
    'The first month is crucial as the basic structure of the baby\'s body is forming. This is a time for you to take extra care of yourself, both physically and emotionally.',
    'Remember to consult with your healthcare provider to ensure you are getting the right nutrients and to address any concerns you might have during this early stage of pregnancy.',
  ];

  void _nextText() {
    setState(() {
      _currentTextIndex = (_currentTextIndex + 1) % _textSlides.length;
    });
  }

  void _previousText() {
    setState(() {
      _currentTextIndex = (_currentTextIndex - 1 + _textSlides.length) % _textSlides.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned.fill(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                  },
                ),
                items: [
                  _buildCarouselItem('images/months/eightmonths5.jpg'),
                  _buildCarouselItem('images/months/eightmonths2.jpg'),
                  _buildCarouselItem('images/months/eightmonths3.jpg'),
                ],
              ),
            ),
            Positioned(
  top: 30.0,
  left: 15.0,
  child: Container(
    child: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white), // Adjust color to ensure visibility
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ),
),

            Positioned(
              top: 32,
              left: 58,
              right: 0,
              child: Center(
                child: Text(
                  'E I G H T   M O N T H S',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.9), // Adjust color to ensure visibility
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.60,
              left: 40,
              right: 40,
              bottom: 84, // Adjust bottom to make space for the button
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color:  Color(0xFFe39fa9).withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  'WHAT SHOULD YOU EXPECT?',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Adjust color to ensure visibility
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              _textSlides[_currentTextIndex],
                              style: TextStyle(
                                fontSize: 16.0,
                                height: 1.5,
                                color: Colors.black, // Adjust color to ensure visibility
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 180, // Position the left button slightly above the bottom of the screen
              left: 15, // Position it near the left edge
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFe39fa9).withOpacity(0.5),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 24),
                  onPressed: _previousText,
                ),
              ),
            ),
            Positioned(
              bottom: 180, // Position the right button slightly above the bottom of the screen
              right: 15, // Position it near the right edge
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFe39fa9).withOpacity(0.5),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 24),
                  onPressed: _nextText,
                ),
              ),
            ),
            Positioned(
              bottom: 20, // Position the button slightly above the bottom of the screen
              left: (MediaQuery.of(context).size.width - 130) / 2, // Center the button horizontally
              child: SizedBox(
                width: 130, // Set button width
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
                      color: Colors.black,
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
        Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
      ],
    );
  }
}
