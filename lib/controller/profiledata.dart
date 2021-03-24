import 'package:cikguu_app/model/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDataService {
  final String uid;
  ProfileDataService({this.uid});

  // profile collection reference
  final CollectionReference profileCollection =
      Firestore.instance.collection('profile');

  //change profile stream
  Profile _profileFromSnapshot(DocumentSnapshot snapshot) {
    return Profile(
      uid: uid,
      userType: snapshot.data['userType'],
      fullName: snapshot.data['fullName'],
      phoneNumber: snapshot.data['phoneNumber'],
    );
  }

  // update or create profile data
  Future updateProfileData(
      String userType, String fullName, String phoneNumber) async {
    return await profileCollection.document(uid).setData({
      'userType': userType,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    });
  }

  //get profile stream
  Stream<Profile> get profile {
    return profileCollection
        .document(uid)
        .snapshots()
        .map(_profileFromSnapshot);
  }
}
