import 'package:cikguu_app/controller/tutordata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:cikguu_app/view/home/users/tutee/dashboardTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/historyTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/ongoingTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/pendingTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/rejectTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/unpaidTutee.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/historyTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/rejectTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/unpaidTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/ongoingTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/pendingTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestWrapperTutor extends StatelessWidget {
  final String destination;
  TestWrapperTutor({Key key, this.destination}) : super(key: key);

  Widget thePage(String ds) {
    switch (ds) {
      case 'pending':
        return PendingTutor();
        break;

      case 'accept':
        return OngoingTutor();
        break;

      case 'unpaid':
        return UnpaidTutor();
        break;

      case 'complete':
        return HistoryTutor();
        break;

      case 'reject':
        return RejectTutor();
        break;

      default:
        return DashboardTutee();
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    return StreamProvider<List<Session>>.value(
      value: TutorDataService(id: profile.uid).sessiontutor,
      child: thePage(destination),
    );
  }
}
