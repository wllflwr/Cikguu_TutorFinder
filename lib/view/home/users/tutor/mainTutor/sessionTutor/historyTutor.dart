import 'package:cikguu_app/controller/evaluatedata.dart';
import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/tutordata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:cikguu_app/view/home/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:cikguu_app/model/global.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/widgetSessionTutor.dart';

class HistoryTutor extends StatefulWidget {
  @override
  _HistoryTutorState createState() => _HistoryTutorState();
}

class _HistoryTutorState extends State<HistoryTutor> {
  @override
  Widget build(BuildContext context) {
    final session = Provider.of<List<Session>>(context);
    final sessionData = new List<Session>();
    final profile = Provider.of<Profile>(context);

    final String hd = 'COMPLETED';

    final _formKey = GlobalKey<FormState>();
    final TextEditingController _feedbackController = TextEditingController();

    if (session == null) {
      Loading();
    } else {
      session.forEach((element) {
        element.status == 'complete' ? sessionData.add(element) : null;
      });
    }

    if (sessionData.isNotEmpty) {
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
            child: ListView.builder(
              itemCount: sessionData.length,
              itemBuilder: (context, index) {
                return StreamBuilder(
                  stream: ProfileDataService(uid: sessionData[index].tuteeid)
                      .profile,
                  builder:
                      (BuildContext context, AsyncSnapshot<Profile> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        decoration: BoxDecoration(
                          color: wy,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            //Text(sessionData[index].sessid),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(30, 20, 30, 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          sessionData[index]
                                              .subject
                                              .toUpperCase(),
                                          style: sb,
                                        ),
                                        SizedBox(height: 20),
                                        ProfileDisplay(
                                            snapshot: snapshot,
                                            sessionData: sessionData,
                                            index: index),
                                        SizedBox(height: 25),
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 10, 0, 15),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  RaisedButton(
                                                    color: Colors.blue[300],
                                                    child: Text('Evaluate'),
                                                    onPressed:
                                                        sessionData[index].mark
                                                            ? () {
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (BuildContext
                                                                            context) {
                                                                      return Evaluate(
                                                                        sessid:
                                                                            sessionData[index].sessid,
                                                                        tuteeid:
                                                                            sessionData[index].tuteeid,
                                                                        sesssub:
                                                                            sessionData[index].subject,
                                                                        formKey:
                                                                            _formKey,
                                                                        fdController:
                                                                            _feedbackController,
                                                                      );
                                                                    });
                                                              }
                                                            : null,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Loading();
                    }
                  },
                );
              },
            ),
          ),
        ),
      );
    } else {
      return NoSession(hd: hd, yl: yl, bl: bl, wy: wy);
    }
  }
}

class Evaluate extends StatelessWidget {
  const Evaluate({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required TextEditingController fdController,
    //@required String uid,
    @required String tuteeid,
    @required String sesssub,
    @required String sessid,
    //@required double oldRate,
  })  : _formKey = formKey,
        _fdController = fdController,
        // _uid = uid,
        _tuteeid = tuteeid,
        _sesssub = sesssub,
        _sessid = sessid,
        //_oldRate = oldRate,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _fdController;
  final String _sesssub, _tuteeid, _sessid;
  //final double _oldRate;

  @override
  Widget build(BuildContext context) {
    double _rate = 0;

    return AlertDialog(
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close, color: yl),
                backgroundColor: bl,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    'From the scale of 1-5, please rate the tutee knowledge and understanding for the tutored subject',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                RatingBar.builder(
                  initialRating: _rate,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    _rate = rating;
                    print(rating);
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: bl,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        letterSpacing: 1.5,
                      ),
                    ),
                    onPressed: () async {
                      await EvaluateDataService(uid: _tuteeid)
                          .getEvData(_sesssub, _rate);

                      await TutorDataService(id: _sessid).updateMarkData();
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
