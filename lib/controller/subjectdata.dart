//import 'package:cikguu_app/model/tutor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectDataService {
  final String uid;
  SubjectDataService({this.uid});

  // spm subject document reference
  final DocumentReference subjectDocumentSPM =
      Firestore.instance.collection('subjects').document('spm');

  final CollectionReference subjectDocument =
      Firestore.instance.collection('profile');

  Future createSubjectTeach() async {
    await subjectDocument.document(uid).updateData({
      'subject': {
        'Malay': false,
        'English': false,
        'Science': false,
        'Mathematics': false,
        'History': false,
        'Moral Education': false,
        'Islamic Education': false,
        'Add. Mathematics': false,
        'Chemistry': false,
        'Biology': false,
        'Physics': false,
        'Economics': false,
      }
    });
  }

  // spm subject add
  Future addSubjectTutorSPM(
      String name, String img, String subject, double price) async {
    return await subjectDocumentSPM
        .collection(subject)
        .document(uid)
        .setData({'name': name, 'img': img, 'price': price});
  }

  // remove spm subject
  Future deleteSubjectTutorSPM(String subject) async {
    return await subjectDocumentSPM.collection(subject).document(uid).delete();
  }
}
