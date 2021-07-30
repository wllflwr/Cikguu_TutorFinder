import 'package:cikguu_app/controller/feeddata.dart';
import 'package:cikguu_app/model/feedback.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/feedbackTutor/feedbackTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedWrapper extends StatelessWidget {
  //const FeedWrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    return StreamProvider<FeedList>.value(
      value: FeedDataService(uid: profile.uid).feedback,
      child: FeedbackTutor(),
    );
  }
}
