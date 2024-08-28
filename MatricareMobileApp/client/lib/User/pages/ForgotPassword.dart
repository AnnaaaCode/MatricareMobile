import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgotPasswordBody(),
    );
  }
}

class ForgotPasswordBody extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the size of the device
    var screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Positioned elements
          Positioned(
            top: 0,
            left: 0,
            right: 20,
            child: Container(
              width: double.infinity,
              height: 800.0,
              child: Stack(
                children: [
                  // CustomPaint for the shape
                  CustomPaint(
                    painter: CustomShapePainter(),
                    child: Container(), // This container can be empty
                  ),
                  // Positioned Text
                  Positioned(
                    top: 90.0, // Adjust the vertical position of the text
                    left: 30.0, // Adjust the horizontal position of the text
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forget Your \n Password',
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Positioned IconButton in front of the CustomPaint
                  Positioned(
                    top: 40.0, // Adjust the vertical position of the icon
                    left: 10.0, // Adjust the horizontal position of the icon
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                       onPressed: () {
              Navigator.pop(context);
            },
                    ),
                  ),
                ],
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 200.0), // Adjust this value to add space for the header text
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)), // Set border color
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)), // Set border color
                  ),
                  labelStyle: TextStyle(color: Color.fromARGB(199, 0, 0, 0)), // Change label color to lighter black
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromARGB(199, 0, 0, 0), // Adjust text color to lighter black
                  fontFamily: 'Roboto', // Set your desired font family
                  fontWeight: FontWeight.normal, // Set font weight
                  fontStyle: FontStyle.normal, // Set font style
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.white, // Set text color to white
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF9a6cb4)), // Set button background color
                  overlayColor: MaterialStateProperty.all<Color>(Color(0xFFF0E0E0).withOpacity(0.3)),
                  minimumSize: MaterialStateProperty.all<Size>(Size(10.0, 50.0)), // Set button width and height
                  mouseCursor: MaterialStateProperty.all<MouseCursor>(SystemMouseCursors.click),
                ),
              ),
            ],
          ),
        ),
      ],
     ));
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF9a6cb4) // Main color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * .6, 0)
      ..quadraticBezierTo(
        size.width * .7,
        size.height * .08,
        size.width * .9,
        size.height * .05,
      )
      ..arcToPoint(
        Offset(
          size.width * .93,
          size.height * .15,
        ),
        radius: Radius.circular(size.height * .05),
        largeArc: true,
      )
      ..cubicTo(
        size.width * .6,
        size.height * .15,
        size.width * .5,
        size.height * .46,
        0,
        size.height * .3,
      )
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Forgot Password Page',
    home: ForgotPassword(),
  ));
}
