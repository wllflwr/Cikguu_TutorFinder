import 'package:cikguu_app/view/home/users/tutor/sessionTutor/evaluateTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/sessionTutor/ongoingTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/sessionTutor/pendingTutor.dart';
import 'package:flutter/material.dart';

class SessionTutor extends StatefulWidget {
  @override
  _SessionTutorState createState() => _SessionTutorState();
}

class _SessionTutorState extends State<SessionTutor> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Ongoing'),
              Tab(text: 'Unpaid'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PendingTutor(),
            OngoingTutor(),
            EvaluateTutor(),
          ],
        ),
      ),
    );
  }
}
