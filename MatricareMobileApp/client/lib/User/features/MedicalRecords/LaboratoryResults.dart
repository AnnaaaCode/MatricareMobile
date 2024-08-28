import 'package:client/User/features/ResourceLibrary.dart';
import 'package:client/User/pages/HomePage.dart';
import 'package:client/User/pages/NotificationPage.dart';
import 'package:client/User/pages/UserProfilePage.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(LaboratoryResults());
}

class LaboratoryResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.80,
              child: Image.asset(
                'images/pic2.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 2),
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                ),
              ),
            ),
            Positioned(
              top: 50.0,
              left: 10.0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Positioned(
              top: 57.0,
              left: 40.0,
              right: 0.0,
              child: Center(
                child: Text(
                  'Laboratory Results',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 140.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                   color: Color(0xFF9a6cb4).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                 child: TextField(
  decoration: InputDecoration(
    hintText: 'Search by date...',
    border: InputBorder.none,
    suffixIcon: Icon(Icons.search),
    hintStyle: TextStyle(color: Colors.black.withOpacity(0.8)), // Optional: color for the hint text
  ),
  style: TextStyle(color: Colors.black), // Set the text color to black
)
              ),
            ),
            Positioned(
              top: 200.0,
              left: 25.0,
              child: Container(
                width: MediaQuery.of(context).size.width - 50, // Adjusted width
                height: 500.0, // Adjusted height
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 255, 255, 255).withOpacity(0.7)),
                    dataRowColor: MaterialStateColor.resolveWith((states) => Color(0xFF9a6cb4).withOpacity(0.7)),
                    headingTextStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                    dataTextStyle: TextStyle(color: Colors.black),
                    columns: [
                      DataColumn(label: Text('Laboratory Date', style: TextStyle(fontSize: 18.0),),),
                      DataColumn(label: Text('Exam Result', style: TextStyle(fontSize: 18.0),),),
                      DataColumn(label: Text('Diagnosis', style: TextStyle(fontSize: 18.0),),),
                      DataColumn(label: Text('Results', style: TextStyle(fontSize: 18.0),),),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('2022-01-01')),
                        DataCell(Text('Exam Result 1')),
                        DataCell(Text('Mild')),
                        DataCell(
                          TextButton(
  style: TextButton.styleFrom(
    foregroundColor: Colors.black, // This sets the text color to black
  ),
  child: Text('View'),
  onPressed: () {
    // Implement view functionality
  },
)
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2022-02-01')),
                        DataCell(Text('Exam Result 2')),
                        DataCell(Text('Mild')),
                        DataCell(
                          TextButton(
  style: TextButton.styleFrom(
    foregroundColor: Colors.black, // This sets the text color to black
  ),
  child: Text('View'),
  onPressed: () {
    // Implement view functionality
  },
)
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2022-03-01')),
                        DataCell(Text('Exam Result 3')),
                        DataCell(Text('Mild')),
                        DataCell(
                          TextButton(
  style: TextButton.styleFrom(
    foregroundColor: Colors.black, // This sets the text color to black
  ),
  child: Text('View'),
  onPressed: () {
    // Implement view functionality
  },
)
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                color: Color(0xFFC98F8F),
                child: Center(
                  child: Text(
                    'Swipe horizontally to see more',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Color(0xFFC98F8F),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.white),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.library_books, color: Colors.white),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Library()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person_2_rounded, color: Colors.white),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfilePage()));
                      },
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
}
