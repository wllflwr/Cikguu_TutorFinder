import 'package:cikguu_app/view/authenticate/register.dart';
import 'package:cikguu_app/view/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin = true;

  void toggleView() {
    setState(() => showSignin = !showSignin);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin) {
      return SingIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
