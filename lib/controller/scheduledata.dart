//import 'package:flutter/material.dart';
import 'package:cikguu_app/model/schedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleDataService {
  final String uid;

  ScheduleDataService({this.uid});

  // schedule document reference
  final CollectionReference scheduleDocument =
      Firestore.instance.collection('profile');

  // update schedule data
  Future updateSheduleData(String day, String slot, bool event) async {
    return await scheduleDocument
        .document(uid)
        .collection('schedule')
        .document(day)
        .updateData({
      slot: event,
    });
  }

  // create schedule collection
  Future createScheduleData() async {
    bool slot = false;
    List<String> day = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];

    for (int a = 0; a < day.length; a++) {
      await scheduleDocument
          .document(uid)
          .collection('schedule')
          .document(day[a])
          .setData({
        'order': a + 1,
        'slot1': slot,
        'slot2': slot,
        'slot3': slot,
      });
    }
  }

  //change schedule list stream to object list
  List<Schedule> _scheduleFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Schedule(
        id: doc.documentID,
        slot1: doc.data['slot1'],
        slot2: doc.data['slot2'],
        slot3: doc.data['slot3'],
      );
    }).toList();
  }

  //get schedule data list
  Stream<List<Schedule>> get schedule {
    return scheduleDocument
        .document(uid)
        .collection('schedule')
        .orderBy('order')
        .snapshots()
        .map(_scheduleFromSnapshot);
  }
}
