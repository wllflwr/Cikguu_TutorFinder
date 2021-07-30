import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/rate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RateDataService {
  final String uid;
  RateDataService({this.uid});

  // feed collection reference
  final CollectionReference rateCollection =
      Firestore.instance.collection('rating');

  Rate _rateFromSnapshot(DocumentSnapshot snapshot) {
    //FeedList feedlist;
    return Rate(
      theRate: snapshot.data['rate'],
    );
  }

  Future createRateData() async {
    return await rateCollection.document(uid).setData({
      'rate': 0.0,
    });
  }

  // update tutee rate
  Future updateRatingData(double oldRate, double newRate) async {
    double theRate = calculateRating(oldRate, newRate);

    return await rateCollection.document(uid).updateData({
      'rate': theRate,
    });
  }

  Stream<Rate> get rating {
    return rateCollection.document(uid).snapshots().map(_rateFromSnapshot);
  }

  dynamic data;

  Future getRateData(double nRate) async {
    //final DocumentReference document =
    //   Firestore.instance.collection('rating').document(uid);

    DocumentSnapshot rateSnapshot = await rateCollection.document(uid).get();
    double oldRate = rateSnapshot.data['rate'];
    print(rateSnapshot.data.toString());

    return await RateDataService(uid: uid).updateRatingData(oldRate, nRate);
  }
}
