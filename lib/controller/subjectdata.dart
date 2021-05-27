//import 'package:cikguu_app/model/tutor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectDataService {
  final String uid;
  SubjectDataService({this.uid});

  // spm subject document reference
  final DocumentReference subjectDocumentSPM =
      Firestore.instance.collection('subjects').document('spm');

  // spm subject add
  Future addSubjectTutorSPM(String name, String img, String subject) async {
    return await subjectDocumentSPM.collection(subject).document(uid).setData({
      'name': name,
      'img': img,
    });
  }

  // remove spm subject
  Future deleteSubjectTutorSPM(String subject) async {
    return await subjectDocumentSPM.collection(subject).document(uid).delete();
  }
}
