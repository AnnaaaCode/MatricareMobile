import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(FAQ());
}

class FAQ extends StatelessWidget {
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
                  'Frequently Asked Questions',
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
              top: 100.0, // Adjust this value to fit below the title
              left: 0.0,
              right: 0.0,
              bottom: 0.0, // Ensures the ListView takes up the remaining space
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: <Widget>[
                    faqContainer('What is Matricare?', 
                      'Matricare is a comprehensive pregnancy support app that offers personalized pregnancy tracking, expert advice, health tips, and a supportive community.'),
                    faqContainer('How does the pregnancy tracking work?', 
                      'Our app provides a detailed timeline of your pregnancy with personalized updates based on your due date and progress.'),
                    faqContainer('Can I track multiple pregnancies?', 
                      'Yes, you can track multiple pregnancies and keep records for each one separately.'),
                    faqContainer('Is the app free?', 
                      'Matricare offers both free and premium versions. The free version provides essential features, while the premium version includes additional support and customization options.'),
                    faqContainer('How do I get expert advice?', 
                      'You can access expert advice through articles, videos, and live Q&A sessions with healthcare professionals available in the app.'),
                    faqContainer('Are there any community features?', 
                      'Yes, the app includes community forums and support groups where you can connect with other users and share experiences.'),
                    faqContainer('How can I contact customer support?', 
                      'You can contact customer support through the app’s help section or by sending an email to support@matricare.com.'),
                    faqContainer('Can I sync the app with my calendar?', 
                      'Yes, the app can sync with your calendar to remind you of important appointments and milestones.'),
                    faqContainer('What are the privacy measures in place?', 
                      'Matricare follows strict privacy guidelines and encrypts your data to ensure your information is secure.'),
                    faqContainer('How often is the app updated?', 
                      'We regularly update the app to include new features, improvements, and the latest information to support your pregnancy journey.'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget faqContainer(String question, String answer) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            question,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            answer,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
