import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(Settings());
}

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isDarkMode = false; // Track dark mode setting
  bool _enableNotifications = true; // Track notifications setting
  bool _isSilentMode = false; // Track silent mode setting
  double _fontSize = 16.0; // Track font size setting

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
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
                   color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),  // Adjust the color and opacity to create the shadow effect
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
                  'Settings',
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
                    settingOption(
                      'Dark Mode',
                      Switch(
                        value: _isDarkMode,
                        onChanged: (bool value) {
                          setState(() {
                            _isDarkMode = value;
                          });
                        },
                      ),
                    ),
                    settingOption(
                      'Enable Notifications',
                      Switch(
                        value: _enableNotifications,
                        onChanged: (bool value) {
                          setState(() {
                            _enableNotifications = value;
                          });
                        },
                      ),
                    ),
                    settingOption(
                      'Silent Mode',
                      Switch(
                        value: _isSilentMode,
                        onChanged: (bool value) {
                          setState(() {
                            _isSilentMode = value;
                          });
                        },
                      ),
                    ),
                    settingOption(
                      'Font Size',
                      DropdownButton<double>(
                        value: _fontSize,
                        items: <double>[12.0, 14.0, 16.0, 18.0, 20.0]
                            .map<DropdownMenuItem<double>>((double value) {
                          return DropdownMenuItem<double>(
                            value: value,
                            child: Text('$value'),
                          );
                        }).toList(),
                        onChanged: (double? value) {
                          setState(() {
                            _fontSize = value ?? _fontSize;
                          });
                        },
                      ),
                    ),
                    settingOption(
                      'App Language',
                      DropdownButton<String>(
                        value: 'English',
                        items: <String>['English', 'Spanish', 'French']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          // Handle language change
                        },
                      ),
                    ),
                    settingOption(
                      'Help & Support',
                      TextButton(
                        child: Text('Contact Support'),
                        onPressed: () {
                          // Navigate to contact support page or show contact information
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingOption(String title, Widget widget) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          widget,
        ],
      ),
    );
  }
}
