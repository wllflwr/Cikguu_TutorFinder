import 'package:cikguu_app/controller/evaluatedata.dart';
import 'package:cikguu_app/controller/feeddata.dart';
import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/ratedata.dart';
import 'package:cikguu_app/controller/scheduledata.dart';
import 'package:cikguu_app/controller/subjectdata.dart';
import 'package:cikguu_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    //return user != null ? User(uid: user.uid) : null;
    if (user != null) {
      return User(uid: user.uid);
    } else {
      return null;
    }
  }

  // auth user change stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  // register email & password
  Future registerWithEmailAndPassword(bool usertype, String name, String phone,
      String email, String password) async {
    try {
      //create user email and password
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;

      // create users main details
      await ProfileDataService(
        uid: user.uid,
      ).createProfileData(usertype, name, phone);

      // create tutor schedule
      if (usertype) {
        await ScheduleDataService(uid: user.uid).createScheduleData();
        await FeedDataService(uid: user.uid).createFeedbackData();
        await RateDataService(uid: user.uid).createRateData();
      } else {
        await EvaluateDataService(uid: user.uid).createEvaluationData();
      }

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
