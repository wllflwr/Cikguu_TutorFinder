import 'package:cikguu_app/controller/ratedata.dart';
import 'package:cikguu_app/controller/tutordata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/rate.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:cikguu_app/view/home/users/tutee/dashboardTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/historyTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/unpaidTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/ongoingTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/pendingTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/rejectTutee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestWrapperTutee extends StatelessWidget {
  final String destination;
  TestWrapperTutee({Key key, this.destination});

  Widget thePage(String ds) {
    switch (ds) {
      case 'pending':
        return PendingTutee();
        break;

      case 'accept':
        return OngoingTutee();
        break;

      case 'unpaid':
        return UnpaidTutee();
        break;

      case 'complete':
        return HistoryTutee();
        break;

      case 'reject':
        return RejectTutee();
        break;

      default:
        return DashboardTutee();
    }
  }

  //TestWrapperTutee({Key key, this.destination});
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    return StreamProvider<List<Session>>.value(
      value: TutorDataService(id: profile.uid).sessiontutee,
      child: thePage(destination),
    );
  }
}
