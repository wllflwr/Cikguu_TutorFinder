import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/tutordata.dart';
import 'package:cikguu_app/model/global.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:cikguu_app/view/home/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/widgetSessionTutor.dart';

class PendingTutor extends StatefulWidget {
  @override
  _PendingTutorState createState() => _PendingTutorState();
}

class _PendingTutorState extends State<PendingTutor> {
  @override
  Widget build(BuildContext context) {
    final session = Provider.of<List<Session>>(context);
    final sessionData = new List<Session>();
    final String hd = 'PENDING';

    if (session == null) {
      Loading();
    } else {
      session.forEach((element) {
        element.status == 'pending' ? sessionData.add(element) : null;
      });
    }

    if (sessionData.isNotEmpty) {
      return Scaffold(
        backgroundColor: yl,
        appBar: PreferredSize(
          child: Header(hd: hd, bl: bl, wy: wy),
          preferredSize: Size.fromHeight(80.0),
        ),
        body: Container(
          color: wy,
          child: Container(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
              right: 8,
            ),
            decoration: BoxDecoration(
              color: yl,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
              ),
            ),
            child: ListView.builder(
              itemCount: sessionData.length,
              itemBuilder: (context, index) {
                return StreamBuilder(
                  stream: ProfileDataService(uid: sessionData[index].tuteeid)
                      .profile,
                  builder:
                      (BuildContext context, AsyncSnapshot<Profile> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        decoration: BoxDecoration(
                          color: wy,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            //Text(sessionData[index].sessid),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    sessionData[index].subject.toUpperCase(),
                                    style: sb,
                                  ),
                                  SizedBox(height: 20),
                                  ProfileDisplay(
                                      snapshot: snapshot,
                                      sessionData: sessionData,
                                      index: index),
                                  SizedBox(height: 25),
                                  Center(
                                    child: Container(
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            RaisedButton(
                                                color: gn,
                                                child: Text('Accept'),
                                                onPressed: () async {
                                                  await TutorDataService()
                                                      .updateTutorSessionData(
                                                          sessionData[index]
                                                              .sessid,
                                                          'accept');
                                                }),
                                            RaisedButton(
                                                color: rd,
                                                child: Text('Reject'),
                                                onPressed: () async {
                                                  await TutorDataService()
                                                      .updateTutorSessionData(
                                                          sessionData[index]
                                                              .sessid,
                                                          'reject');
                                                })
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Loading();
                    }
                  },
                );
              },
            ),
          ),
        ),
      );
    } else {
      return NoSession(hd: hd, yl: yl, bl: bl, wy: wy);
    }
  }
}
