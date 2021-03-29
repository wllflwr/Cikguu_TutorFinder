import 'package:cikguu_app/controller/auth.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/tutor/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTutor extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    print(profile.image);

    return Scaffold(
      backgroundColor: Colors.white,
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
                Navigator.of(context).pushNamed('/tutorSettings');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Tutor Home'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'))
        ],
      ),
      body: ListView(
        children: <Widget>[
          ClipOval(
            child: SizedBox(
              height: 200.0,
              width: 200.0,
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/cikguu-app.appspot.com/o/data%2Fuser%2F0%2Fcom.example.cikguu_app%2Fcache%2Fimage_picker9157477870511932354.jpg?alt=media&token=d48f336e-0e73-48ac-97d5-4f5315635a57',
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text('Name'),
            subtitle: Text(profile.fullName),
          ),
          ListTile(
            title: Text('Phone Number'),
            subtitle: Text(profile.phoneNumber),
          ),
          ListTile(
            title: Text('Bio'),
            subtitle: Text(profile.bio),
          ),
          ListTile(
            title: Text('Address'),
            subtitle: Text(profile.address),
          ),
          ListTile(
            title: Text('Education'),
            subtitle: Text(profile.education),
          ),
          ListTile(
            title: Text('Experience'),
            subtitle: Text(profile.extraInfo),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );

    /*
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tutor Home'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'))
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    ); */
  }
}
