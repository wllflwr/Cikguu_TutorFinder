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
      type: snapshot.data['userType'],
      fullName: snapshot.data['fullName'],
      phoneNumber: snapshot.data['phoneNumber'],
      bio: snapshot.data['bio'],
      address: snapshot.data['address'],
      education: snapshot.data['education'],
      extraInfo: snapshot.data['extraInfo'],
      image: snapshot.data['image'],
      exam: snapshot.data['exam'],
      subject: snapshot.data['subject'],
      price: snapshot.data['price'],
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
  String tee =
      'https://firebasestorage.googleapis.com/v0/b/cikguu-app.appspot.com/o/595271aabbdbfbc2d7bd5b85b7227540.png?alt=media&token=6e37ea89-3ffb-42e2-b15f-60095b125a26';
  String tor =
      'https://firebasestorage.googleapis.com/v0/b/cikguu-app.appspot.com/o/0f2a9a9dfdca0374082be57293ad9424.png?alt=media&token=12ab22b6-14e3-4230-9483-821197a67e67';
  Future createProfileData(
      bool userType, String fullName, String phoneNumber) async {
    return await profileCollection.document(uid).setData({
      'userType': userType,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'bio': 'Please fill',
      'address': 'Please fill',
      'education': 'Please fill',
      'extraInfo': 'Please fill',
      'image': userType ? tor : tee,
      'subect': [],
      'price': 0.0,
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

  // update price rate data
  Future updatePriceData(double price) async {
    return await profileCollection.document(uid).updateData({
      'price': price,
    });
  }

  // update subjects array
  Future updateSubject(String subject) async {
    return await profileCollection.document(uid).updateData({
      'subject': FieldValue.arrayUnion([subject]),
    });
  }

  // delete subject from array
  Future deleteSubject(String subject) async {
    return await profileCollection.document(uid).updateData({
      'subject': FieldValue.arrayRemove([subject]),
    });
  }

  // update teaching info
  Future updateTutoringData(String subject) async {
    return await profileCollection
        .document(uid)
        .updateData({'subject': subject});
  }

  // update image data
  Future updateProfileImageData(String url) async {
    return await profileCollection.document(uid).updateData({
      'image': url,
    });
  }
}
