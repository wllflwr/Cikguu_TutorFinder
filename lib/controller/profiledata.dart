import 'package:cikguu_app/model/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'dart:io';
//import 'package:image_picker/image_picker.dart';

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
    );
  }

  // create profile data
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

  // update image data
  Future updateProfileImageData(String url) async {
    return await profileCollection.document(uid).updateData({
      'image': url,
    });
  }

  // get profile stream
  Stream<Profile> get profile {
    return profileCollection
        .document(uid)
        .snapshots()
        .map(_profileFromSnapshot);
  }
}
