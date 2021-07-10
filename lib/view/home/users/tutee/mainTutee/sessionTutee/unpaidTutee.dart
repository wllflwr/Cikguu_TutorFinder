import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:cikguu_app/view/home/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cikguu_app/model/global.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/widgetSessionTutee.dart';

class UnpaidTutee extends StatefulWidget {
  @override
  _UnpaidTuteeState createState() => _UnpaidTuteeState();
}

class _UnpaidTuteeState extends State<UnpaidTutee> {
  @override
  Widget build(BuildContext context) {
    final session = Provider.of<List<Session>>(context);
    final sessionData = new List<Session>();
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
          preferredSize: Size.fromHeight(80.0),
          child: Header(hd: hd, bl: bl, wy: wy),
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
                //if (sessionData[index].status == 'evaluate') {
                // stream for tutee profile
                return StreamBuilder(
                  stream: ProfileDataService(uid: sessionData[index].tutorid)
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
                              padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                  //SizedBox(height: 25),
                                  // Container(
                                  //   margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                                  //   child: Center(
                                  //     child: RaisedButton(
                                  //         color: Colors.red[300],
                                  //         child: Text('Unpaid'),
                                  //         onPressed: () {}),
                                  //   ),
                                  // ),
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
