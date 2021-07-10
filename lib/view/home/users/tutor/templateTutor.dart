import 'package:cikguu_app/controller/auth.dart';
import 'package:cikguu_app/view/home/loading.dart';
import 'package:cikguu_app/view/home/users/tutor/dashboardTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/historyTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/homeTutor/homeTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/manageTutor/profileTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/manageTutor/subjectTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/scheduleTutor/scheduleTutor.dart';

import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:fancy_bottom_bar/fancy_bottom_bar.dart';

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
    DashboardTutor(),
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
      // appBar: AppBar(
      //   title: Text('Tutor Home'),
      //   backgroundColor: Colors.blue,
      // ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[200],
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
              //leading: Icon(Icons.account_circle),
              title: Text('Manage Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileTutor()),
                );
              },
            ),
            ListTile(
              //leading: Icon(Icons.account_circle),
              title: Text('Manage Tutoring'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubjectTutor()),
                );
              },
            ),
            ListTile(
              //leading: Icon(Icons.account_circle),
              title: Text('Test Loading'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Loading()),
                );
              },
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              height: 50.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0))),
                onPressed: () async {
                  await _auth.signOut();
                },
                color: Colors.blue[200],
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: FancyBottomBar(
        bgColor: Colors.blue[100],
        items: [
          FancyBottomItem(
              title: Text("Profile"),
              icon: Image.asset(
                'assets/profile.png',
                width: 35.0,
              )),
          FancyBottomItem(
            title: Text("Schedule"),
            icon: Image.asset(
              'assets/calendar.png',
              width: 35.0,
            ),
          ),
          FancyBottomItem(
            title: Text("Active"),
            icon: Image.asset(
              'assets/progress.png',
              width: 35.0,
            ),
          ),
          FancyBottomItem(
            title: Text("Past"),
            icon: Image.asset(
              'assets/history.png',
              width: 35.0,
            ),
          ),
        ],
        onItemSelected: _onItemTapped,
        selectedPosition: _selectedIndex,
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   //type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.blue,
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.black,
      //   onTap: _onItemTapped,
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       title: Text('Home'),
      //       backgroundColor: Colors.blue,
      //     ),
      //     BottomNavigationBarItem(
      //       //icon: Image.asset('assets/search.png'),
      //       icon: Icon(Entypo.calendar),
      //       title: Text('Business'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(MaterialIcons.assignment),
      //       title: Text('School'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(MaterialIcons.assignment_late),
      //       title: Text('School'),
      //     ),
      //   ],
      // ),
    );
  }
}
