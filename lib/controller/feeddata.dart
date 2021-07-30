import 'package:cikguu_app/controller/ratedata.dart';
import 'package:cikguu_app/model/rate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cikguu_app/model/feedback.dart';

class FeedDataService {
  final String uid;
  FeedDataService({this.uid});

  // feed collection reference
  final CollectionReference feedCollection =
      Firestore.instance.collection('feedback');

  FeedList _feedFromSnapshot(DocumentSnapshot snapshot) {
    //FeedList feedlist;
    return FeedList(
      //feedlist = FeedList.fromMap(snapshot.data),
      fdb: snapshot.data['feed'],
    );
  }

  // get profile stream
  Stream<FeedList> get feedback {
    return feedCollection.document(uid).snapshots().map(_feedFromSnapshot);
  }

  Future createFeedbackData() async {
    return await feedCollection.document(uid).setData({
      "feed": [],
    });
  }

  Future addFeedbackData(String fd, String sb, String tn, double rt) async {
    return await feedCollection.document(uid).updateData({
      "feed": FieldValue.arrayUnion([
        {
          "fd": fd,
          "sb": sb,
          "tn": tn,
          "rt": rt,
        },
      ])
    });
  }
}
