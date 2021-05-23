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
      );
    }).toList();
  }

  // get session stream for tutor
  Stream<List<Session>> get sessiontutorpending {
    return sessionCollection
        .where('tutorid', isEqualTo: id)
        .where('status', isEqualTo: 'pending')
        .snapshots()
        .map(_sessionFromSnapshot);
  }

  // get session stream for tutor
  Stream<List<Session>> get sessiontutorongoing {
    return sessionCollection
        .where('tutorid', isEqualTo: id)
        .where('status', isEqualTo: 'accept')
        .snapshots()
        .map(_sessionFromSnapshot);
  }

  // get session stream for tutor
  Stream<List<Session>> get sessiontutorevaluate {
    return sessionCollection
        .where('tutorid', isEqualTo: id)
        .where('status', isEqualTo: 'ongoing')
        .snapshots()
        .map(_sessionFromSnapshot);
  }

  // get session stream for tutor
  Stream<List<Session>> get sessiontutorpaid {
    return sessionCollection
        .where('tutorid', isEqualTo: id)
        .where('status', isEqualTo: 'complete')
        .snapshots()
        .map(_sessionFromSnapshot);
  }

  // update tutor session
  Future updateTutorSessionData(String sessid, String status) async {
    return await sessionCollection.document(sessid).updateData({
      'status': status,
    });
  }

  // get session stream for tutee
  Stream<List<Session>> get sessiontuteepending {
    return sessionCollection
        .where('tuteeid', isEqualTo: id)
        .where('status', isEqualTo: 'pending')
        .snapshots()
        .map(_sessionFromSnapshot);
  }
}
