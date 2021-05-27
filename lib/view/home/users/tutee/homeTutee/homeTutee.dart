import 'package:cikguu_app/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTutee extends StatelessWidget {
  final TextStyle userN = TextStyle(fontSize: 30.0, height: 100.0);

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    print('image');
    print(profile.fullName);
    print(profile.image);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            child: Image.network(
              profile.image,
              fit: BoxFit.contain,
            ),
          ),

          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35.0),
                    topLeft: Radius.circular(35.0))),
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
            transform: Matrix4.translationValues(0.0, -50.0, 0.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text(
                      profile.fullName,
                      style: userN,
                    ),
                  ),
                  subtitle: Center(child: Text(profile.bio)),
                ),
              ],
            ),
          ),
          // ListTile(
          //   title: Text('Name'),
          //   subtitle: Text(profile.fullName),
          // ),
          // ListTile(
          //   title: Text('Phone Number'),
          //   subtitle: Text(profile.phoneNumber),
          // ),
          // ListTile(
          //   title: Text('Bio'),
          //   subtitle: Text(profile.bio),
          // ),
          // ListTile(
          //   title: Text('Address'),
          //   subtitle: Text(profile.address),
          // ),
          // ListTile(
          //   title: Text('Education'),
          //   subtitle: Text(profile.education),
          // ),
          // ListTile(
          //   title: Text('Experience'),
          //   subtitle: Text(profile.extraInfo),
          // ),
        ],
      ),
    );
  }
}
