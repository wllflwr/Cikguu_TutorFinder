import 'package:cikguu_app/model/evaluate.dart';
import 'package:cikguu_app/model/global.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/loading.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/subjectTutee/subjectManageTutee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class SubjectTutee extends StatefulWidget {
  //const SubjectTutee({ Key? key }) : super(key: key);

  @override
  _SubjectTuteeState createState() => _SubjectTuteeState();
}

class _SubjectTuteeState extends State<SubjectTutee> {
  final String hd = 'SUBJECT';
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    final ev = Provider.of<EvaluateList>(context);

    if (ev != null) {
      var evMap = ev.evaluateList;
      List<Evaluate> evData = extractEvaluation(evMap);

      return Scaffold(
        backgroundColor: yl,
        appBar: PreferredSize(
          child: Header(hd: hd, bl: bl, wy: wy),
          preferredSize: Size.fromHeight(80.0),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            'Manage',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              letterSpacing: 1.2,
            ),
          ),
          backgroundColor: bl,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageSubjectTutee()),
            );
          },
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
                Expanded(
                  child: ListView.builder(
                      itemCount: ev.evaluateList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(30),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: wy,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                evData[index].sb.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Divider(
                                  color: bl,
                                  height: 3,
                                ),
                              ),
                              LinearPercentIndicator(
                                center: Text(
                                  (evData[index].mk * 100).floor().toString() +
                                      ('%'),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 280,
                                lineHeight: 30.0,
                                percent: evData[index].mk,
                                backgroundColor: rd,
                                progressColor: gn,
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Loading();
    }
  }
}
