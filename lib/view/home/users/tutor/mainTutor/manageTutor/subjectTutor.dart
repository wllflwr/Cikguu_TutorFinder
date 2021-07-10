//import 'package:cikguu_app/controller/auth.dart';
import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/subjectdata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/manageTutor/gridSubjectTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cikguu_app/model/global.dart';

class SubjectTutor extends StatefulWidget {
  @override
  _SubjectTutorState createState() => _SubjectTutorState();
}

class _SubjectTutorState extends State<SubjectTutor> {
  // TabController _tabController;

  // @override
  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 2, vsync: this);
  // }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    final String hd = 'Subject';

    //List<bool>.generate(subjectList.length, (index) => null);
    List<bool> subjectState;
    //List<bool>.filled(subjectList.length, , growable: false);
    print('printing e');

    subjectState.forEach((s) {
      subjectList.forEach((e) {
        s = profile.subject.contains(e.toString().toLowerCase()) ? true : false;

        print(e);
      });
    });

    // _s.forEach((s) {
    //   print(s);
    // });

    //spm
    //bool _bio = profile.subject.contains('biology') ? true : false;
    //bool _chem = profile.subject.contains('chemistry') ? true : false;
    //bool _phy = profile.subject.contains('physic') ? true : false;

    return Scaffold(
      backgroundColor: yl,
      appBar: PreferredSize(
        child: Header(hd: hd, bl: bl, wy: wy),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: Container(
        color: wy,
        //controller: _tabController,
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 10,
            right: 8,
          ),
          decoration: BoxDecoration(
            color: yl,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
            ),
          ),
          child: GridView.count(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: List.generate(
              subjectList.length,
              (index) => SubjectOptions(
                subjectName: subjectList[index],
                subjectState: subjectState[index],
              ),
            ),
          ),

          // Column(
          //   children: <Widget>[
          //     Container(
          //       child: FilterChip(
          //           selected: _bio,
          //           label: Text('Biology'),
          //           //avatar: Text('W'),
          //           onSelected: (bool selected) async {
          //             setState(() {
          //               _bio = !_bio;
          //             });
          //             if (_bio) {
          //               // add in subject collection
          //               await SubjectDataService(uid: profile.uid)
          //                   .addSubjectTutorSPM(
          //                       profile.fullName, profile.image, 'biology');

          //               // add in profile collection
          //               await ProfileDataService(uid: profile.uid)
          //                   .updateSubject('biology');
          //             } else {
          //               // remove in profile collection
          //               await SubjectDataService(uid: profile.uid)
          //                   .deleteSubjectTutorSPM('biology');

          //               // remove from profile subject array
          //               await ProfileDataService(uid: profile.uid)
          //                   .deleteSubject('biology');
          //             }
          //           }),
          //     ),
          //     FilterChip(
          //         selected: _chem,
          //         label: Text('Chemistry'),
          //         //avatar: Text('W'),
          //         onSelected: (bool selected) async {
          //           setState(() {
          //             _chem = !_chem;
          //           });
          //           if (_chem) {
          //             // add in subject collection
          //             await SubjectDataService(uid: profile.uid)
          //                 .addSubjectTutorSPM(
          //                     profile.fullName, profile.image, 'chemistry');

          //             // add in profile collection
          //             await ProfileDataService(uid: profile.uid)
          //                 .updateSubject('chemistry');
          //           } else {
          //             // remove in profile collection
          //             await SubjectDataService(uid: profile.uid)
          //                 .deleteSubjectTutorSPM('chemistry');

          //             // remove from profile subject array
          //             await ProfileDataService(uid: profile.uid)
          //                 .deleteSubject('chemistry');
          //           }
          //         }),
          //     FilterChip(
          //         selected: _phy,
          //         label: Text('Physic'),
          //         //avatar: Text('W'),
          //         onSelected: (bool selected) async {
          //           setState(() {
          //             _phy = !_phy;
          //           });
          //           if (_chem) {
          //             // add in subject collection
          //             await SubjectDataService(uid: profile.uid)
          //                 .addSubjectTutorSPM(
          //                     profile.fullName, profile.image, 'physic');

          //             // add in profile collection
          //             await ProfileDataService(uid: profile.uid)
          //                 .updateSubject('physic');
          //           } else {
          //             // remove in profile collection
          //             await SubjectDataService(uid: profile.uid)
          //                 .deleteSubjectTutorSPM('physic');

          //             // remove from profile subject array
          //             await ProfileDataService(uid: profile.uid)
          //                 .deleteSubject('physic');
          //           }
          //         }),
          //   ],
          // ),
        ),
      ),
    );
  }
}
