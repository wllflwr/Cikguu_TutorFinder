// import 'package:cikguu_app/controller/auth.dart';
// import 'package:cikguu_app/view/home/users/tutee/mainTutee/browseTutee/browseTutee.dart';
// import 'package:cikguu_app/view/home/users/tutee/dashboardTutee.dart';
// import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/historyTutee.dart';
// import 'package:cikguu_app/view/home/users/tutee/mainTutee/homeTutee/homeTutee.dart';
// import 'package:cikguu_app/view/home/users/tutee/mainTutee/manageTutee/profileTutee.dart';
// import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/sessionTutee.dart';
// import 'package:cikguu_app/view/home/users/tutor/loading.dart';
// import 'package:flutter/material.dart';
// //import 'package:flashy_tab_bar/flashy_tab_bar.dart';
// //import 'package:flutter_icons/flutter_icons.dart';
// import 'package:fancy_bottom_bar/fancy_bottom_bar.dart';

// class TemplateTutee extends StatefulWidget {
//   @override
//   _TemplateTuteeState createState() => _TemplateTuteeState();
// }

// class _TemplateTuteeState extends State<TemplateTutee> {
//   final AuthService _auth = AuthService();

//   int _selectedIndex = 0;

//   // list of bottom navigation page
//   List<Widget> _widgetOptions = <Widget>[
//     HomeTutee(),
//     BrowseTutee(),
//     //SessionTutee(),
//     HistoryTutee(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // setting knob
//       // appBar: AppBar(
//       //   title: Text('Tutee', style: TextStyle(color: Colors.black)),
//       //   backgroundColor: Colors.purple[100],
//       // ),

//       // setting
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.purple[100],
//               ),
//               child: Text(
//                 'Drawer Header',
//                 style: TextStyle(
//                   color: Colors.black87,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               //leading: Icon(Icons.account_circle),
//               title: Text('Manage Profile'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ProfileTutee()),
//                 );
//               },
//             ),
//             ListTile(
//               //leading: Icon(Icons.account_circle),
//               title: Text('Test Loading'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Loading()),
//                 );
//               },
//             ),
//             ListTile(
//               //leading: Icon(Icons.account_circle),
//               title: Text('Test Dashboard'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => DashboardTutee()),
//                 );
//               },
//             ),
//             // ListTile(
//             //   //leading: Icon(Icons.account_circle),
//             //   title: Text('Dashboard'),
//             //   onTap: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => DashboardTutee()),
//             //     );
//             //   },
//             // ),
//             Container(
//               margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
//               height: 50.0,
//               child: RaisedButton(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(20.0),
//                         topLeft: Radius.circular(20.0),
//                         bottomRight: Radius.circular(20.0),
//                         bottomLeft: Radius.circular(20.0))),
//                 onPressed: () async {
//                   await _auth.signOut();
//                 },
//                 color: Colors.purple[200],
//                 child: Text(
//                   'Logout',
//                   style: TextStyle(color: Colors.black, fontSize: 15.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

//       // page content
//       body: _widgetOptions.elementAt(_selectedIndex),

//       bottomNavigationBar: FancyBottomBar(
//         bgColor: Colors.purple[100],
//         items: [
//           FancyBottomItem(
//               title: Text("Profile"),
//               icon: Image.asset(
//                 'assets/profile.png',
//                 width: 35.0,
//               )),
//           FancyBottomItem(
//             title: Text("Browse"),
//             icon: Image.asset(
//               'assets/search.png',
//               width: 35.0,
//             ),
//           ),
//           FancyBottomItem(
//             title: Text("Active"),
//             icon: Image.asset(
//               'assets/progress.png',
//               width: 35.0,
//             ),
//           ),
//           FancyBottomItem(
//             title: Text("Past"),
//             icon: Image.asset(
//               'assets/history.png',
//               width: 35.0,
//             ),
//           ),
//         ],
//         onItemSelected: _onItemTapped,
//         selectedPosition: _selectedIndex,
//       ),

//       // // bottom navigation
//       // bottomNavigationBar: BottomNavigationBar(
//       //   //iconSize: 30.0,
//       //   backgroundColor: Colors.purple[100],
//       //   currentIndex: _selectedIndex,
//       //   selectedItemColor: Colors.black,
//       //   onTap: _onItemTapped,
//       //   items: <BottomNavigationBarItem>[
//       //     BottomNavigationBarItem(
//       //       //icon: Icon(Icons.person),
//       //       icon: Image.asset(
//       //         'assets/profile.png',
//       //         width: 35.0,
//       //       ),
//       //       title: Text('Home'),
//       //       backgroundColor: Colors.purple[100],
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Image.asset(
//       //         'assets/search.png',
//       //         width: 35.0,
//       //       ),
//       //       //icon: Icon(Entypo.calendar),
//       //       title: Text('Browse'),
//       //       //backgroundColor: Colors.blue,
//       //     ),
//       //     BottomNavigationBarItem(
//       //       //icon: Icon(MaterialIcons.assignment),
//       //       icon: Image.asset(
//       //         'assets/progress.png',
//       //         width: 35.0,
//       //       ),
//       //       title: Text('School'),
//       //     ),
//       //     BottomNavigationBarItem(
//       //       //icon: Icon(MaterialIcons.assignment_late),
//       //       icon: Image.asset(
//       //         'assets/history.png',
//       //         width: 35.0,
//       //       ),
//       //       title: Text('School'),
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }
