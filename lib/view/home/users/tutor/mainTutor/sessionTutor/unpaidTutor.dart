import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/tutordata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:cikguu_app/view/home/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/widgetSessionTutor.dart';
import 'package:cikguu_app/model/global.dart';

class UnpaidTutor extends StatefulWidget {
  @override
  _UnpaidTutorState createState() => _UnpaidTutorState();
}

class _UnpaidTutorState extends State<UnpaidTutor> {
  @override
  Widget build(BuildContext context) {
    final session = Provider.of<List<Session>>(context);

    final sessionData = new List<Session>();

    final Color yl = Color(0xffF0C742);
    final Color wy = Colors.white;
    final Color bl = Colors.black;
    final String hd = 'UNPAID';

    if (session == null) {
      Loading();
    } else {
      session.forEach((element) {
        element.status == 'attend' ? sessionData.add(element) : null;
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
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            RaisedButton(
                                                child: Text('Paid'),
                                                onPressed: () async {
                                                  await TutorDataService()
                                                      .updateTutorSessionData(
                                                          sessionData[index]
                                                              .sessid,
                                                          'complete');
                                                }),
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
                      return Text('Data not found');
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
