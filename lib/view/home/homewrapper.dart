import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/tutee/templateTutee.dart';
import 'package:cikguu_app/view/home/tutor/templateTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWrapper extends StatefulWidget {
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    if (profile.userType == 'tutor') {
      return TemplateTutor();
    } else {
      return TemplateTutee();
    }
  }
}
