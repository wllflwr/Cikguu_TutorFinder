//import 'package:cikguu_app/model/schedule.dart';
import 'package:cikguu_app/controller/scheduledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduleTutor extends StatefulWidget {
  @override
  _ScheduleTutorState createState() => _ScheduleTutorState();
}

class _ScheduleTutorState extends State<ScheduleTutor> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    String day = DateFormat.E().format(DateTime.now());
    int date = DateTime.now().day;

    print('date time test');
    //print(DateFormat.yMMMd().format(DateTime.now()));
    //print(DateFormat.E().format(DateTime.now()));
    //String day = DateTime.now().toString();
    print(day);
    print(date);

    return Container(
      child: StreamBuilder<List<Schedule>>(
        stream: ScheduleDataService(uid: profile.uid).schedule,
        builder:
            (BuildContext context, AsyncSnapshot<List<Schedule>> snapshot) {
          if (snapshot.hasData) {
            List<Schedule> scheduleData = snapshot.data;

            return ListView.builder(
              itemCount: scheduleData.length,
              itemBuilder: (context, index) {
                //declare value for button
                bool _slot1 = scheduleData[index].slot1;
                bool _slot2 = scheduleData[index].slot2;
                bool _slot3 = scheduleData[index].slot3;

                return Center(
                  child: Card(
                    color: scheduleData[index].id == day.toLowerCase()
                        ? Colors.pink[100]
                        : Colors.white,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(scheduleData[index].id),
                          Center(
                            child: Row(
                              children: <Widget>[
                                RaisedButton(
                                  color: scheduleData[index].slot1
                                      ? Colors.redAccent
                                      : Colors.greenAccent,
                                  onPressed: () async {
                                    _slot1 = !_slot1;
                                    await ScheduleDataService(uid: profile.uid)
                                        .updateSheduleData(
                                            scheduleData[index].id,
                                            'slot1',
                                            _slot1);
                                  },
                                  child: Text(
                                      scheduleData[index].slot1.toString()),
                                ),
                                RaisedButton(
                                  color: scheduleData[index].slot2
                                      ? Colors.redAccent
                                      : Colors.greenAccent,
                                  onPressed: () async {
                                    _slot2 = !_slot2;
                                    await ScheduleDataService(uid: profile.uid)
                                        .updateSheduleData(
                                            scheduleData[index].id,
                                            'slot2',
                                            _slot2);
                                  },
                                  child: Text(
                                      scheduleData[index].slot2.toString()),
                                ),
                                RaisedButton(
                                  color: scheduleData[index].slot3
                                      ? Colors.redAccent
                                      : Colors.greenAccent,
                                  onPressed: () async {
                                    _slot3 = !_slot3;
                                    await ScheduleDataService(uid: profile.uid)
                                        .updateSheduleData(
                                            scheduleData[index].id,
                                            'slot3',
                                            _slot3);
                                  },
                                  child: Text(
                                      scheduleData[index].slot3.toString()),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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

/*
return Container(
      child: StreamBuilder(
        stream: Firestore.instance
            .collection('profile')
            .document(profile.uid)
            .collection('schedule')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Sorry no schedule in backend'),
            );
          } else {
            return ListView(
              children: snapshot.data.documents.map((document) {
                print('trying to see tutor id');
                print(document.documentID);
                return Center(
                  child: Card(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Text(document.documentID),
                          Center(
                            child: Row(
                              children: <Widget>[
                                RaisedButton(
                                  color: document['slot1']
                                      ? Colors.redAccent
                                      : Colors.greenAccent,
                                  onPressed: () {},
                                  child: Text(document['slot1'].toString()),
                                ),
                                RaisedButton(
                                  color: document['slot2']
                                      ? Colors.redAccent
                                      : Colors.greenAccent,
                                  onPressed: () {},
                                  child: Text(document['slot2'].toString()),
                                ),
                                RaisedButton(
                                  color: document['slot3']
                                      ? Colors.redAccent
                                      : Colors.greenAccent,
                                  onPressed: () {},
                                  child: Text(document['slot3'].toString()),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    ); */
