import 'package:cikguu_app/model/user.dart';
import 'package:cikguu_app/view/authenticate/authenticate.dart';
import 'package:cikguu_app/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //final profile = Provider.of<Profile>(context);
    print('trying to see user in wrapper');

    // return Authenticate or HomeTutor or HomeTutee
    if (user == null) {
      return Authenticate();
    } else {
      print(user.uid);
      //print(profile.userType);
      return Home();
    }
  }
}
