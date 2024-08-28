import 'package:client/User/pages/FetalsGrowth.dart';
import 'package:client/User/pages/ForgotPassword.dart';
import 'package:client/User/pages/LandingPage.dart';
import 'package:client/User/pages/SignupPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 20,
            child: Container(
              width: double.infinity,
              height: 800.0,
              child: Stack(
                children: [
                  Positioned(
                    top: 100.0,
                    left: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back,',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Login!',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 40.0,
                    left: 5.0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
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
          Container(
            margin: EdgeInsets.only(top: 350.0),
            padding: EdgeInsets.symmetric(horizontal: 45.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildTextField('Username', controller: _usernameController),
                  SizedBox(height: 35.0),
                  _buildTextField('Password', obscureText: true, controller: _passwordController),
                  SizedBox(height: 5.0),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPassword()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 70.0),
                    child: ElevatedButton(
                      onPressed: _login,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF9a6cb4)),
                        overlayColor: MaterialStateProperty.all<Color>(Color(0xFFF0E0E0).withOpacity(0.3)),
                        mouseCursor: MaterialStateProperty.all<MouseCursor>(SystemMouseCursors.click),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account yet?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false, TextEditingController? controller}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          labelStyle: TextStyle(color: Color.fromARGB(199, 0, 0, 0)),
        ),
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(
          fontSize: 14.0,
          color: Color.fromARGB(199, 0, 0, 0),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }

  void _login() {
    // Navigate directly to FetalsGrowthBody when the login button is pressed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FetalsGrowthBody()),
    );
  }
}
