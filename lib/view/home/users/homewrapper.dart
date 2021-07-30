import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/loading.dart';
import 'package:cikguu_app/view/home/users/tutee/sessionwrapperTutee.dart';
import 'package:cikguu_app/view/home/users/tutor/sessionwrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    //print(profile.fullName);

    if (profile == null) {
      return Loading();
    } else {
      return MaterialApp(
        home: profile.type ? SessionWrapperTutor() : SessionWrapperTutee(),
      );
    }
  }
}

// class HomeWrapper extends StatefulWidget {
//   @override
//   _HomeWrapperState createState() => _HomeWrapperState();
// }

// class _HomeWrapperState extends State<HomeWrapper> {
//   @override
//   Widget build(BuildContext context) {
//     final profile = Provider.of<Profile>(context);
//     print(profile.type);

//     if (profile.type == null) {
//       return Center(
//         child: CircularProgressIndicator(
//           backgroundColor: Colors.white,
//         ),
//       );
//     } else {
//       return MaterialApp(
//         home: profile.type ? SessionWrapperTutor() : SessionWrapperTutee(),
//       );
//     }
//   }
// }
