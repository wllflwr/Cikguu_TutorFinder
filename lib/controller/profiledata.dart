//import 'package:cikguu_app/controller/scheduledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDataService {
  final String uid;
  ProfileDataService({this.uid});

  // profile collection reference
  final CollectionReference profileCollection =
      Firestore.instance.collection('profile');

  //change profile stream to object
  Profile _profileFromSnapshot(DocumentSnapshot snapshot) {
    return Profile(
      uid: uid,
      userType: snapshot.data['userType'],
      fullName: snapshot.data['fullName'],
      phoneNumber: snapshot.data['phoneNumber'],
      bio: snapshot.data['bio'],
      address: snapshot.data['address'],
      education: snapshot.data['education'],
      extraInfo: snapshot.data['extraInfo'],
      image: snapshot.data['image'],
      exam: snapshot.data['exam'],
      spm: snapshot.data['spm'],
      pt3: snapshot.data['pt3'],
    );
  }

  // get profile stream
  Stream<Profile> get profile {
    return profileCollection
        .document(uid)
        .snapshots()
        .map(_profileFromSnapshot);
  }

  // create profile data
  String img =
      'https://firebasestorage.googleapis.com/v0/b/cikguu-app.appspot.com/o/data%2Fuser%2F0%2Fcom.example.cikguu_app%2Fcache%2Fuser.png?alt=media&token=764e87b9-d621-4bee-bd4c-3ce5f6ec8b08';
  Future createProfileData(
      String userType, String fullName, String phoneNumber) async {
    return await profileCollection.document(uid).setData({
      'userType': userType,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'bio': 'Please fill',
      'address': 'Please fill',
      'education': 'Please fill',
      'extraInfo': 'Please fill',
      'image': img,
      'spm': [],
      'pt3': [],
    });
  }

  // update profile data
  Future updateProfileData(String name, String bio, String phone,
      String address, String education, String extra) async {
    return await profileCollection.document(uid).updateData({
      'fullName': name,
      'phoneNumber': phone,
      'bio': bio,
      'address': address,
      'education': education,
      'extraInfo': extra,
    });
  }

  // update subjects array
  Future updateSubject(String exam, String subject) async {
    return await profileCollection.document(uid).updateData({
      exam: FieldValue.arrayUnion([subject]),
    });
  }

  // delete subject from array
  Future deleteSubject(String exam, String subject) async {
    return await profileCollection.document(uid).updateData({
      exam: FieldValue.arrayRemove([subject]),
    });
  }

  // update teaching info
  Future updateTutoringData(String exam, String subject) async {
    return await profileCollection
        .document(uid)
        .updateData({'exam': exam, 'subject': subject});
  }

  // update image data
  Future updateProfileImageData(String url) async {
    return await profileCollection.document(uid).updateData({
      'image': url,
    });
  }
}
