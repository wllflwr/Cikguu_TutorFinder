import 'package:cikguu_app/controller/tutordata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:cikguu_app/view/home/users/tutor/templateTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionWrapperTutor extends StatefulWidget {
  @override
  _SessionWrapperTutorState createState() => _SessionWrapperTutorState();
}

class _SessionWrapperTutorState extends State<SessionWrapperTutor> {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    return StreamProvider<List<Session>>.value(
      value: TutorDataService(id: profile.uid).sessiontutor,
      child: TemplateTutor(),
    );
  }
}
