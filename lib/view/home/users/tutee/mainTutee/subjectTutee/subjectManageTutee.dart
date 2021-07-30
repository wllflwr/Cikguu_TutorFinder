import 'package:cikguu_app/controller/evaluatedata.dart';
import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/model/global.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageSubjectTutee extends StatefulWidget {
  //const ManageSubjectTutee({ Key? key }) : super(key: key);

  @override
  _ManageSubjectTuteeState createState() => _ManageSubjectTuteeState();
}

class _ManageSubjectTuteeState extends State<ManageSubjectTutee> {
  @override
  Widget build(BuildContext context) {
    final String hd = 'Manage Subject';
    final profile = Provider.of<Profile>(context);

    var _subjectState = new List(subjectList.length);

    for (int i = 0; i < subjectList.length; i++) {
      if (profile.subject == null) {
        _subjectState[i] = false;
      } else {
        if (profile.subject.contains(subjectList[i].eng.toLowerCase())) {
          _subjectState[i] = true;
        } else {
          _subjectState[i] = false;
        }
      }
    }

    return Scaffold(
      backgroundColor: yl,
      appBar: PreferredSize(
        child: Header(hd: hd, bl: bl, wy: wy),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: Container(
        color: wy,
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
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                      'Please click subject you take for your exam until turns green'),
                ),
              ),
              Expanded(
                child: GridView.count(
                  childAspectRatio: 2,
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 10,
                  children: List.generate(
                    subjectList.length,
                    (index) => FilterChip(
                      selectedColor: _subjectState[index] ? gn : rd,
                      backgroundColor: _subjectState[index] ? gn : rd,
                      selected: _subjectState[index],
                      label: Container(
                          width: 100,
                          child: Text(
                            subjectList[index].eng,
                            style: TextStyle(fontSize: 15),
                          )),
                      padding: EdgeInsets.all(30),
                      //avatar: Text('W'),
                      onSelected: (bool selected) async {
                        setState(() {
                          _subjectState[index] = !_subjectState[index];
                        });
                        if (_subjectState[index]) {
                          // add in subject collection
                          await EvaluateDataService(uid: profile.uid)
                              .updateEvaluationData(
                                  subjectList[index].eng.toLowerCase(), 0.0);

                          // add in profile collection
                          await ProfileDataService(uid: profile.uid)
                              .updateSubject(
                                  subjectList[index].eng.toLowerCase());
                        } else {
                          // remove in profile collection
                          await EvaluateDataService(uid: profile.uid)
                              .deleteEvaluationSubject(
                            subjectList[index].eng.toLowerCase(),
                          );

                          // remove from profile subject array
                          await ProfileDataService(uid: profile.uid)
                              .deleteSubject(
                                  subjectList[index].eng.toLowerCase());
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
