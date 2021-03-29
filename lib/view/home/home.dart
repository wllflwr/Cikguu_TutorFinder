import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/user.dart';
import 'package:cikguu_app/view/home/homewrapper.dart';
import 'package:cikguu_app/view/home/tutor/manage/profileTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamProvider<Profile>.value(
      value: ProfileDataService(uid: user.uid).profile,
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          '/tutorSettings': (context) => ProfileTutor(),
          //'/b': (BuildContext context) => MyPage(title: 'page B'),
          //'/c': (BuildContext context) => MyPage(title: 'page C'),
        },
        home: HomeWrapper(),
      ),
    );
  }
}

/*
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<Profile>(
      stream: ProfileDataService(uid: user.uid).profile,
      builder: (context, snapshot) {
        
        if (snapshot.hasData) {
          Profile profile = snapshot.data;
          if (profile.userType == 'tutor') {
            return HomeTutor();
          } else {
            return HomeTutee();
          }
        }
        return 
      },
    );
  }
} */
