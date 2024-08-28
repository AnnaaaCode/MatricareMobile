import 'package:flutter/material.dart';
import 'dart:ui'; 

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color:Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
  'Notifications',
  textAlign: TextAlign.center,
 style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                ),
),
      ),
      body: Stack(
        children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Adjust the blur to create an inner shadow effect
            child: Container(
               color: Color(0xFF9a6cb4).withOpacity(0.1), // Adjust the color and opacity to create the shadow effect
            ),
          ),
        ),    // Content
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF9a6cb4),
                  radius: 100.0,
                  child: Icon(
                    Icons.notifications,
                    size: 100.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "You're all caught up!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Come back for health tips and updates!",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
