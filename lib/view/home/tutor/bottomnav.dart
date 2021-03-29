import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Home'),
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
    );
  }
}
