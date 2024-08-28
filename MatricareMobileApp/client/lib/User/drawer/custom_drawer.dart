import 'package:flutter/material.dart';
import 'package:client/User/drawer/AboutMatricare.dart';
import 'package:client/User/drawer/FAQ.dart';
import 'package:client/User/drawer/Settings.dart';
import 'package:client/User/pages/UserProfilePage.dart';
import 'package:client/User/pages/LandingPage.dart';

class CustomDrawer extends StatelessWidget {
  final String username;

  const CustomDrawer({required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: Color(0xFF9a6cb4),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/profile.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      username,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 3,
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text(
                      'View Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfilePage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.help, color: Colors.white),
                    title: Text(
                      'FAQ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text(
                      'About Matricare',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMatricare()));
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 310.0),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
