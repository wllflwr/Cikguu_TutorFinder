import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryTutee extends StatefulWidget {
  @override
  _HistoryTuteeState createState() => _HistoryTuteeState();
}

class _HistoryTuteeState extends State<HistoryTutee> {
  @override
  Widget build(BuildContext context) {
    final sessionData = Provider.of<List<Session>>(context);

    return ListView.builder(
      itemCount: sessionData.length,
      itemBuilder: (context, index) {
        if (sessionData[index].status == 'complete') {
          // stream for tutor profile
          return StreamBuilder(
            stream: ProfileDataService(uid: sessionData[index].tutorid).profile,
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
                                          child: Text('Completed'),
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
            heightFactor: 15.0,
            child: Text('No unpaid tutor session'),
          );
        }
      },
    );
  }
}
