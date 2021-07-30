import 'dart:convert';
import 'package:cikguu_app/model/evaluate.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/rate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EvaluateDataService {
  final String uid;
  EvaluateDataService({this.uid});

  // feed collection reference
  final CollectionReference evCollection =
      Firestore.instance.collection('evaluation');

  EvaluateList _evFromSnapshot(DocumentSnapshot snapshot) {
    //FeedList feedlist;
    return EvaluateList(
      evaluateList: snapshot.data['evaluate'],
    );
  }

  Stream<EvaluateList> get evaluation {
    return evCollection.document(uid).snapshots().map(_evFromSnapshot);
  }

  Future createEvaluationData() async {
    return await evCollection.document(uid).setData({
      "evaluate": [],
    });
  }

  // update subject ev
  Future updateEvaluationData(String sb, double mk) async {
    return await evCollection.document(uid).updateData({
      "evaluate": FieldValue.arrayUnion([
        {
          "sb": sb,
          "mk": mk,
        },
      ])
    });
  }

  // delete subject from array
  Future deleteEvaluationData(String sb, double mk) async {
    return await evCollection.document(uid).updateData({
      'evaluate': FieldValue.arrayRemove([
        {'sb': sb, 'mk': mk}
      ]),
    });
  }

  Future getEvData(String sEv, double nEv) async {
    // snapshot evaluation
    DocumentSnapshot evSnapshot = await evCollection.document(uid).get();
    var evMap = evSnapshot.data['evaluate'];
    List<Evaluate> dataEv = extractEvaluation(evMap);
    double oldEv;

    // calculation for new data
    dataEv.forEach((e) {
      if (e.sb == sEv) {
        oldEv = e.mk;
      }
    });
    double pEv = nEv / 5 * 100;
    double newEv = (oldEv + pEv) / 200;
    double percentEv = newEv;

    // remove first and update new one
    await EvaluateDataService(uid: uid).deleteEvaluationData(sEv, oldEv);
    await EvaluateDataService(uid: uid).updateEvaluationData(sEv, percentEv);
  }

  // delete subject from evaluation
  Future deleteEvaluationSubject(String sEv) async {
    // snapshot evaluation
    DocumentSnapshot evSnapshot = await evCollection.document(uid).get();
    var evMap = evSnapshot.data['evaluate'];
    List<Evaluate> dataEv = extractEvaluation(evMap);

    // calculation for new data
    double oldEv;
    dataEv.forEach((e) {
      if (e.sb == sEv) {
        oldEv = e.mk;
      }
    });

    await EvaluateDataService(uid: uid).deleteEvaluationData(sEv, oldEv);
  }
}
