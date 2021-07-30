//import 'dart:html';

import 'package:cikguu_app/model/session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorDataService {
  //String sessid;
  String id;
  TutorDataService({this.id});

  // session collection reference
  final CollectionReference sessionCollection =
      Firestore.instance.collection('session');

  // tutor session add
  Future addTutorSession(String tutorid, String tuteeid, String subject,
      String date, String day, int slot, String venue) async {
    return await sessionCollection.add({
      'tutorid': tutorid,
      'tuteeid': tuteeid,
      'subject': subject,
      'date': date,
      'day': day,
      'slot': slot,
      'venue': venue,
      'status': 'pending',
      'rate': true,
      'mark': true,
    });
    //.then((value) => sessid = value.documentID);
  }

  List<Session> _sessionFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Session(
        doc.documentID,
        doc.data['tutorid'],
        doc.data['tutornm'],
        doc.data['tuteeid'],
        doc.data['tuteenm'],
        doc.data['subject'],
        doc.data['date'],
        doc.data['day'],
        doc.data['venue'],
        doc.data['slot'],
        doc.data['status'],
        doc.data['rate'],
        doc.data['mark'],
      );
    }).toList();
  }

  // get session stream for tutor
  Stream<List<Session>> get sessiontutor {
    return sessionCollection
        .where('tutorid', isEqualTo: id)
        .snapshots()
        .map(_sessionFromSnapshot);
  }

  // update rate data
  Future updateRateData() async {
    return await sessionCollection.document(id).updateData({
      'rate': false,
    });
  }

  // update mark data
  Future updateMarkData() async {
    return await sessionCollection.document(id).updateData({
      'mark': false,
    });
  }

  // update tutor session
  Future updateTutorSessionData(String sessid, String status) async {
    return await sessionCollection.document(sessid).updateData({
      'status': status,
    });
  }

  // update tutor session
  Future feedTutorSessionData(String sessid, bool rate) async {
    return await sessionCollection.document(sessid).updateData({
      'rate': rate,
    });
  }

  // get session stream for tutee
  Stream<List<Session>> get sessiontutee {
    return sessionCollection
        .where('tuteeid', isEqualTo: id)
        .snapshots()
        .map(_sessionFromSnapshot);
  }
}
