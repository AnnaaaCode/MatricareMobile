import 'dart:ui'; // Import for blur effect
import 'package:client/User/pages/LandingPage.dart';
import 'package:client/User/pages/LoginPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SignUpPage());
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignUpBody(),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  String? _selectedRole;
  bool _termsAccepted = false; // Track if terms are accepted

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // CustomPaint and Positioned elements at the top
        Positioned(
          top: -20.0, // Adjust the vertical position of the logo
          right: 20.0, // Adjust the horizontal position of the logo
          child: Container(
            width: 400.0, // Width of the container
            height: 750.0, // Height of the container
            child: Stack(
              children: [
                Positioned(
                  top: 90.0, // Adjust the vertical position of the text
                  left: 70.0, // Adjust the horizontal position of the text
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Sign Up!',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned IconButton in front of the CustomPaint
                Positioned(
                  top: 40.0, // Adjust the vertical position of the icon
                  left: 40.0, // Adjust the horizontal position of the icon
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LandingPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),

        // Main content with form fields
        Column(
          children: [
            SizedBox(height: 200), // Add space to prevent overlap
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildTextField('Full Name', controller: _fullNameController),
                    SizedBox(height: 17.0),
                    _buildTextField('Username', controller: _usernameController),
                    SizedBox(height: 17.0),
                    _buildTextField('Email', controller: _emailController),
                    SizedBox(height: 17.0),
                    _buildTextField('Phone Number', controller: _phoneController),
                    SizedBox(height: 17.0),
                    _buildTextField('Password', obscureText: true, controller: _passwordController),
                    SizedBox(height: 17.0),
                    _buildTextField('Confirm Password', obscureText: true, controller: _confirmPasswordController),
                    SizedBox(height: 17.0),
                    _buildDropdownMenu(),
                    SizedBox(height: 17.0),  // Adjust the spacing here
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 100.0),
                      child: ElevatedButton(
                        onPressed: _signup,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF9a6cb4)),
                          overlayColor: MaterialStateProperty.all<Color>(Color(0xFFF0E0E0).withOpacity(0.3)),
                          mouseCursor: MaterialStateProperty.all<MouseCursor>(SystemMouseCursors.click),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                          child: Text(
                            'CREATE ACCOUNT',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0), // Adjusted margin top
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false, TextEditingController? controller}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelStyle: TextStyle(color: Color.fromARGB(199, 0, 0, 0)),
        ),
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(
          fontSize: 12.0,
          color: Color.fromARGB(199, 0, 0, 0),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  Widget _buildDropdownMenu() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'User Role',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelStyle: TextStyle(color: const Color.fromARGB(199, 0, 0, 0)),
        ),
        value: _selectedRole,
        items: <String?>['Patient', 'Consultant'].map((String? value) {
          return DropdownMenuItem<String>(
            value: value!,
            child: Text(
              value,
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedRole = newValue!;
          });
        },
      ),
    );
  }

  void _signup() {
    if (_isValidInput()) {
      // Show Terms and Conditions dialog upon successful signup
      _showTermsAndConditionsDialog();
    } else {
      // Show dialog if input is not valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Validation Error'),
          content: Text('Please make sure all fields are filled out correctly.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _showTermsAndConditionsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'images/LOGO.png', // Replace with your logo asset path
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Terms and Conditions',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                      'Please read and accept our Terms and Conditions to proceed. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus euismod, lacus et fringilla vehicula, lectus augue viverra velit, non semper libero odio vel turpis. Ut vulputate justo non augue sodales, id finibus dolor lacinia. Fusce tempor, odio vel viverra maximus, metus nunc feugiat risus, ac congue quam urna at orci. Morbi id sem vehicula, vestibulum ligula at, condimentum neque. Nullam volutpat nulla at risus tempor, quis fermentum justo fermentum.',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center, // Aligns text with checkbox
                      children: [
                        Checkbox(
                          value: _termsAccepted,
                          onChanged: (bool? value) {
                            setState(() {
                              _termsAccepted = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            'I agree to the terms and conditions',
                            textAlign: TextAlign.left, // Aligns text to the left of its container
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: _termsAccepted
                      ? () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        }
                      : null,
                  child: Text('Confirm'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  bool _isValidInput() {
    return _fullNameController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _passwordController.text == _confirmPasswordController.text &&
        _selectedRole != null;
  }
}
