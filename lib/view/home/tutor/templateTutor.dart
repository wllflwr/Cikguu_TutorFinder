import 'package:cikguu_app/controller/auth.dart';
import 'package:cikguu_app/view/home/tutor/historyTutor.dart';
import 'package:cikguu_app/view/home/tutor/homeTutor.dart';
import 'package:cikguu_app/view/home/tutor/manageTutor/subjectTutor.dart';
import 'package:cikguu_app/view/home/tutor/scheduleTutor.dart';
import 'package:cikguu_app/view/home/tutor/sessionTutor/sessionTutor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'manageTutor/profileTutor.dart';

class TemplateTutor extends StatefulWidget {
  @override
  _TemplateTutorState createState() => _TemplateTutorState();
}

class _TemplateTutorState extends State<TemplateTutor> {
  final AuthService _auth = AuthService();

  int _selectedIndex = 0;
  //static TextStyle optionStyle =
  //TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomeTutor(),
    ScheduleTutor(),
    SessionTutor(),
    HistoryTutor(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Home'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Manage Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileTutor()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Manage Tutoring'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubjectTutor()),
                );
              },
            ),
            RaisedButton(
              onPressed: () async {
                await _auth.signOut();
              },
              color: Colors.blue,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Home'),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Entypo.calendar),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialIcons.assignment),
            title: Text('School'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MaterialIcons.assignment_late),
            title: Text('School'),
          ),
        ],
      ),
    );
  }
}
