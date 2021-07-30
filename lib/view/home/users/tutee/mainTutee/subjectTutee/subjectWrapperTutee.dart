import 'package:cikguu_app/controller/evaluatedata.dart';
import 'package:cikguu_app/model/evaluate.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/subjectTutee/subjectTutee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectWrapperTutee extends StatelessWidget {
  //const SubjectWrapperTutee({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    return StreamProvider<EvaluateList>.value(
      value: EvaluateDataService(uid: profile.uid).evaluation,
      child: SubjectTutee(),
      catchError: (_, __) => null,
    );
  }
}
