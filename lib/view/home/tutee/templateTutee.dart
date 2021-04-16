import 'package:cikguu_app/controller/auth.dart';
import 'package:cikguu_app/view/home/tutee/browse/browseTutee.dart';
import 'package:cikguu_app/view/home/tutee/homeTutee.dart';
import 'package:cikguu_app/view/home/tutee/manageTutee/profileTutee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TemplateTutee extends StatefulWidget {
  @override
  _TemplateTuteeState createState() => _TemplateTuteeState();
}

class _TemplateTuteeState extends State<TemplateTutee> {
  final AuthService _auth = AuthService();

  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // list of bottom navigation page
  List<Widget> _widgetOptions = <Widget>[
    HomeTutee(),
    BrowseTutee(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // setting knob
      appBar: AppBar(
        title: Text('Tutee'),
        backgroundColor: Colors.blue,
      ),

      // setting
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
                  MaterialPageRoute(builder: (context) => ProfileTutee()),
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

      // page content
      body: _widgetOptions.elementAt(_selectedIndex),

      // bottom navigation
      bottomNavigationBar: BottomNavigationBar(
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
            title: Text('Browse'),
            backgroundColor: Colors.blue,
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
