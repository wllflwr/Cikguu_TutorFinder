import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataService {
  final String uid;
  UserDataService({this.uid});

  // collection reference
  final CollectionReference userCollection =
      Firestore.instance.collection('user');

  Future updateUserData(
      String userType, String fullName, String phoneNumber) async {
    return await userCollection.document(uid).setData({
      'userType': userType,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    });
  }
}
