import 'package:cikguu_app/controller/tutordata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:cikguu_app/view/home/users/tutee/dashboardTutee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionWrapperTutee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    return StreamProvider<List<Session>>.value(
      value: TutorDataService(id: profile.uid).sessiontutee,
      child: DashboardTutee(),
    );
  }
}
