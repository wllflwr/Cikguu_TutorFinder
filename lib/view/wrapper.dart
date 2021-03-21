import 'package:cikguu_app/model/user.dart';
import 'package:cikguu_app/view/authenticate/authenticate.dart';
import 'package:cikguu_app/view/tutor/homeTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user.userType);

    // return Authenticate or HomeTutor or HomeTutee
    if (user == null) {
      return Authenticate();
    } else {
      return HomeTutor();
    }
  }
}
