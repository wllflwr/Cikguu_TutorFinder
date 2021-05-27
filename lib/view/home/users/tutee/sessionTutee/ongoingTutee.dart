import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OngoingTutee extends StatefulWidget {
  @override
  _OngoingTuteeState createState() => _OngoingTuteeState();
}

class _OngoingTuteeState extends State<OngoingTutee> {
  @override
  Widget build(BuildContext context) {
    final sessionData = Provider.of<List<Session>>(context);

    return ListView.builder(
      itemCount: sessionData.length,
      itemBuilder: (context, index) {
        if (sessionData[index].status == 'accept') {
          // stream for tutee profile
          return StreamBuilder(
            stream: ProfileDataService(uid: sessionData[index].tuteeid).profile,
            builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
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
                                        Text(sessionData[index].status),
                                        //Text(sessionData[index].tutorid),
                                      ],
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Row(
                                    children: <Widget>[
                                      RaisedButton(
                                          child: Text('Accepted'),
                                          onPressed: () {}),
                                    ],
                                  ),
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
        } else {
          return Center(
              heightFactor: 15.0, child: Text('No pending tutor session'));
        }
      },
    );
  }
}
