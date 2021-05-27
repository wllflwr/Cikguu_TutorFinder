//import 'package:cikguu_app/controller/auth.dart';
import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/subjectdata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectTutor extends StatefulWidget {
  @override
  _SubjectTutorState createState() => _SubjectTutorState();
}

class _SubjectTutorState extends State<SubjectTutor>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);

    String spm = 'spm';

    // spm
    bool _bio = profile.spm.contains('biology') ? true : false;
    bool _chem = profile.spm.contains('chemistry') ? true : false;
    bool _phy = profile.spm.contains('physic') ? true : false;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('TabBar Widget'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'SPM',
            ),
            Tab(
              text: 'PT3',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          //SPM
          Column(
            children: <Widget>[
              FilterChip(
                  selected: _bio,
                  label: Text('Biology'),
                  //avatar: Text('W'),
                  onSelected: (bool selected) async {
                    setState(() {
                      _bio = !_bio;
                    });
                    if (_bio) {
                      // add in subject collection
                      await SubjectDataService(uid: profile.uid)
                          .addSubjectTutorSPM(
                              profile.fullName, profile.image, 'biology');

                      // add in profile collection
                      await ProfileDataService(uid: profile.uid)
                          .updateSubject(spm, 'biology');
                    } else {
                      // remove in profile collection
                      await SubjectDataService(uid: profile.uid)
                          .deleteSubjectTutorSPM('biology');

                      // remove from profile subject array
                      await ProfileDataService(uid: profile.uid)
                          .deleteSubject(spm, 'biology');
                    }
                  }),
              FilterChip(
                  selected: _chem,
                  label: Text('Chemistry'),
                  //avatar: Text('W'),
                  onSelected: (bool selected) async {
                    setState(() {
                      _chem = !_chem;
                    });
                    if (_chem) {
                      // add in subject collection
                      await SubjectDataService(uid: profile.uid)
                          .addSubjectTutorSPM(
                              profile.fullName, profile.image, 'chemistry');

                      // add in profile collection
                      await ProfileDataService(uid: profile.uid)
                          .updateSubject(spm, 'chemistry');
                    } else {
                      // remove in profile collection
                      await SubjectDataService(uid: profile.uid)
                          .deleteSubjectTutorSPM('chemistry');

                      // remove from profile subject array
                      await ProfileDataService(uid: profile.uid)
                          .deleteSubject(spm, 'chemistry');
                    }
                  }),
              FilterChip(
                  selected: _phy,
                  label: Text('Physic'),
                  //avatar: Text('W'),
                  onSelected: (bool selected) async {
                    setState(() {
                      _phy = !_phy;
                    });
                    if (_chem) {
                      // add in subject collection
                      await SubjectDataService(uid: profile.uid)
                          .addSubjectTutorSPM(
                              profile.fullName, profile.image, 'physic');

                      // add in profile collection
                      await ProfileDataService(uid: profile.uid)
                          .updateSubject(spm, 'physic');
                    } else {
                      // remove in profile collection
                      await SubjectDataService(uid: profile.uid)
                          .deleteSubjectTutorSPM('physic');

                      // remove from profile subject array
                      await ProfileDataService(uid: profile.uid)
                          .deleteSubject(spm, 'physic');
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
