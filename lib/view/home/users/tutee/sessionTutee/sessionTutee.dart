import 'package:cikguu_app/view/home/users/tutee/sessionTutee/evaluateTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/sessionTutee/ongoingTutee.dart';
import 'package:cikguu_app/view/home/users/tutee/sessionTutee/pendingTutee.dart';
import 'package:flutter/material.dart';

class SessionTutee extends StatefulWidget {
  @override
  _SessionTuteeState createState() => _SessionTuteeState();
}

class _SessionTuteeState extends State<SessionTutee> {
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
            PendingTutee(),
            OngoingTutee(),
            EvaluateTutee(),
          ],
        ),
      ),
    );
  }
}
