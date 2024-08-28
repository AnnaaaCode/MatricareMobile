import 'package:client/User/features/ResourceLibrary.dart';
import 'package:client/User/pages/HomePage.dart';
import 'package:client/User/pages/NotificationPage.dart';
import 'package:client/User/pages/UserProfilePage.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(Medicalhistory());
}

class Medicalhistory extends StatelessWidget {
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
                   color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.8),
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
                  'Medical History',
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
              top: 160.0,
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
              top: 230.0,
              left: 25.0,
              child: Container(
                width: 350.0,
                height: 400.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.7), 
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SingleChildScrollView(
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith((states) =>  Color.fromARGB(255, 255, 255, 255).withOpacity(0.7)),
                    dataRowColor: MaterialStateColor.resolveWith((states) => Color(0xFF9a6cb4).withOpacity(0.7)),
                    headingTextStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                    dataTextStyle: TextStyle(color: Colors.black),
                    columns: [
    DataColumn(
      label: Text(
        'Date',
        style: TextStyle(fontSize: 15.0), // Adjust the font size here
      ),
    ),
    DataColumn(
      label: Text(
        'Assessment',
        style: TextStyle(fontSize: 15.0), // Adjust the font size here
      ),
    ),
    DataColumn(
      label: Text(
        'Notes',
        style: TextStyle(fontSize: 15.0), // Adjust the font size here
      ),
    ),
  ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('2022-01-01')),
                        DataCell(Text('Assessment 1')),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showNotesInputDialog(context);
                            },
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2022-02-01')),
                        DataCell(Text('Assessment 2')),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showNotesInputDialog(context);
                            },
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2022-03-01')),
                        DataCell(Text('Assessment 3')),
                        DataCell(
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showNotesInputDialog(context);
                            },
                          ),
                        ),
                      ]),
                    ],
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

  // Function to show input dialog for editing notes
  void _showNotesInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Notes"),
          content: TextField(
            decoration: InputDecoration(hintText: "Enter notes here..."),
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Save"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
