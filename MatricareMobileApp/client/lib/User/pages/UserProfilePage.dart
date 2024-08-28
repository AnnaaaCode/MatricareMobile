import 'dart:io';
import 'dart:ui';
import 'package:client/User/features/ResourceLibrary.dart';
import 'package:client/User/pages/HomePage.dart';
import 'package:client/User/pages/NotificationPage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(UserProfilePage());
}

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: UserProfileBody(),
      ),
    );
  }
}

class UserProfileBody extends StatefulWidget {
  @override
  _UserProfileBodyState createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  String fullName = "John Doe"; // Combine first and last name into one variable
  String address = "123 Main St";
  String email = "john.doe@example.com";
  String contactNumber = "123-456-7890";
  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Color(0xFF9a6cb4).withOpacity(0.8),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 95.0,
                  backgroundImage: _profileImage == null
                      ? AssetImage('assets/profile_picture.jpg')
                      : FileImage(_profileImage!) as ImageProvider,
                  child: _profileImage == null
                      ? Icon(Icons.camera_alt, size: 30.0)
                      : null,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 80.0),
                padding: EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 22.0),
                    Text('FULL NAME \n$fullName', style: TextStyle(color: Colors.black, fontSize: 19.0)),
                    SizedBox(height: 22.0),
                    Text('ADDRESS \n$address', style: TextStyle(color: Colors.black, fontSize: 19.0)),
                    SizedBox(height: 22.0),
                    Text('EMAIL \n$email', style: TextStyle(color: Colors.black, fontSize: 19.0)),
                    SizedBox(height: 22.0),
                    Text('CONTACT NUMBER \n$contactNumber', style: TextStyle(color: Colors.black, fontSize: 19.0)),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          right: 20,
          child: GestureDetector(
            onTap: () {
              _showEditProfileDialog(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.edit,
                color: Color(0xFFC98F8F),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: _profileImage == null
                        ? AssetImage('assets/profile_picture.jpg')
                        : FileImage(_profileImage!) as ImageProvider,
                    child: _profileImage == null
                        ? Icon(Icons.camera_alt, size: 30.0)
                        : null,
                  ),
                ),
                SizedBox(height: 20.0),
                _buildTextField('Full Name', (value) {
                  setState(() {
                    fullName = value; 
                  });
                }),
                SizedBox(height: 20.0),
                _buildTextField('Address', (value) {
                  setState(() {
                    address = value;
                  });
                }),
                SizedBox(height: 20.0),
                _buildTextField('Email', (value) {
                  setState(() {
                    email = value;
                  });
                }),
                SizedBox(height: 20.0),
                _buildTextField('Contact Number', (value) {
                  setState(() {
                    contactNumber = value;
                  });
                }),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  // Save the updated profile information
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(String labelText, Function(String) onChanged) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC98F8F)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      ),
      onChanged: onChanged,
    );
  }
}
