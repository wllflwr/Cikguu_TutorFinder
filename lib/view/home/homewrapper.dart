import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/tutee/homeTutee.dart';
import 'package:cikguu_app/view/home/tutor/homeTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    if (profile.userType == 'tutor') {
      return HomeTutor();
    } else {
      return HomeTutee();
    }
  }
}
