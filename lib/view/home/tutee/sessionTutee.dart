import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/tutordata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionTutee extends StatefulWidget {
  @override
  _SessionTuteeState createState() => _SessionTuteeState();
}

class _SessionTuteeState extends State<SessionTutee> {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    return Container(
      // stream for tutor session
      child: StreamBuilder<List<Session>>(
        stream: TutorDataService(id: profile.uid).sessiontuteepending,
        builder: (BuildContext context, AsyncSnapshot<List<Session>> snapshot) {
          if (snapshot.hasData) {
            List<Session> sessionData = snapshot.data;
            return ListView.builder(
              itemCount: sessionData.length,
              itemBuilder: (context, index) {
                // stream for tutee profile
                return StreamBuilder(
                  stream: ProfileDataService(uid: sessionData[index].tutorid)
                      .profile,
                  builder:
                      (BuildContext context, AsyncSnapshot<Profile> snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                        child: Card(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                //Text(sessionData[index].sessid),
                                Center(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          ClipOval(
                                            child: SizedBox(
                                              height: 200.0,
                                              width: 100.0,
                                              child: Image.network(
                                                snapshot.data.image,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(sessionData[index].sessid),
                                              //Text(sessionData[index].tuteeid),
                                              Text(snapshot.data.fullName),
                                              Text(sessionData[index].subject),
                                              Text(sessionData[index].date),
                                              Text(sessionData[index].day),
                                              //Text(sessionData[index].status),
                                              //Text(sessionData[index].tutorid),
                                            ],
                                          ),
                                          Center(
                                            child: Row(
                                              children: <Widget>[
                                                RaisedButton(
                                                    child: Text(
                                                        sessionData[index]
                                                            .status),
                                                    onPressed: () {}),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Text('Data not found');
                    }
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
