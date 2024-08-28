import 'dart:ui';
import 'package:client/User/pages/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:client/User/Months/onemonth.dart';
import 'package:client/User/Months/twomonths.dart';
import 'package:client/User/Months/threemonths.dart';
import 'package:client/User/Months/fourmonths.dart';
import 'package:client/User/Months/fivemonths.dart';
import 'package:client/User/Months/sixmonths.dart';
import 'package:client/User/Months/sevenmonths.dart';
import 'package:client/User/Months/eightmonths.dart';
import 'package:client/User/Months/ninemonths.dart';

void main() {
  runApp(GetStartedFetalsGrowth());
}

class GetStartedFetalsGrowth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FetalsGrowthBody(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class FetalsGrowthBody extends StatefulWidget {
  @override
  _FetalsGrowthBodyState createState() => _FetalsGrowthBodyState();
}

class _FetalsGrowthBodyState extends State<FetalsGrowthBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: Icon(Icons.logout, color: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LandingPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Want to know more about your fetal\'s growth?',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10.0),
Column(
  children: List.generate(9, (index) { // Generate 9 containers
    return Column(
      children: [
        GestureDetector(
          onTap: () => _navigateToMonthPage(index + 1, context),
          child: Container(
            margin: EdgeInsets.all(5.0), // Adjust spacing
            decoration: BoxDecoration(
              color: Color(0xFFD1C4E9).withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black, // Set the border color to black
                width: 2.0, // Set the border width
              ),
            ),
            height: 55.0, // Set the desired height
            child: Center(
              child: Text(
                _monthText(index + 1),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5.0), // Margin below each container
      ],
    );
  }),
)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _monthText(int month) {
    switch (month) {
      case 1:
        return 'One Month';
      case 2:
        return 'Two Months';
      case 3:
        return 'Three Months';
      case 4:
        return 'Four Months';
      case 5:
        return 'Five Months';
      case 6:
        return 'Six Months';
      case 7:
        return 'Seven Months';
      case 8:
        return 'Eight Months';
      case 9:
        return 'Nine Months';
      default:
        return 'Invalid Month';
    }
  }

  void _navigateToMonthPage(int month, BuildContext context) {
    switch (month) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => onemonth()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Twomonths()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Threemonths()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Fourmonths()),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Fivemonths()),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sixmonths()),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sevenmonths()),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Eightmonths()),
        );
        break;
      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Ninemonths()),
        );
        break;
    }
  }
}
