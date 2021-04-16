import 'package:cikguu_app/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTutor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          ClipOval(
            child: SizedBox(
              height: 200.0,
              width: 200.0,
              child: Image.network(
                profile.image,
                fit: BoxFit.contain,
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
    );
  }
}
