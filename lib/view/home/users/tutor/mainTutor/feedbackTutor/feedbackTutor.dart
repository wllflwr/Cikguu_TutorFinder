import 'package:cikguu_app/controller/ratedata.dart';
import 'package:cikguu_app/model/feedback.dart';
import 'package:cikguu_app/model/global.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/loading.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class FeedbackTutor extends StatefulWidget {
  //FeedbackTutor({ Key? key }) : super(key: key);

  @override
  _FeedbackTutorState createState() => _FeedbackTutorState();
}

class _FeedbackTutorState extends State<FeedbackTutor> {
  @override
  Widget build(BuildContext context) {
    final String hd = 'FEEDBACK';
    final profile = Provider.of<Profile>(context);
    final feedback = Provider.of<FeedList>(context);

    if (feedback != null) {
      //print(feedback.fdb);
      var feedbackMap = feedback.fdb;
      List<Feed> feedData = extractFeed(feedbackMap);
      print(profile.uid);

      // double rateValue;
      // int rateTotal = 0;
      // feedData.forEach((e) {
      //   rateValue = rateValue + (e.rate);
      //   print(e.rate);
      //   print(rateTotal);
      //   rateTotal++;
      // });

      // for (int i = 0; i < feedData.length; i++) {
      //   rateValue = rateValue + feedData[i].rate;
      //   rateTotal = i;
      // }

      // double currentRate = rateValue / rateTotal;

      print(feedData.length);

      // return Scaffold(
      //   body: Container(
      //     child: RaisedButton(onPressed: () async {
      //       await RateDataService(uid: profile.uid).createRateData();
      //     }),
      //   ),
      // );

      return StreamBuilder(
        stream: Firestore.instance
            .collection('rating')
            .document(profile.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          //print(snapshot.data['rate']);
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: yl,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child: Header(hd: hd, bl: bl, wy: wy),
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
                      Container(
                        color: wy,
                        child: Column(
                          children: <Widget>[
                            Center(child: Text('Current Rating by Tutee')),
                            RatingBar.builder(
                              initialRating:
                                  snapshot.data['rate'], //currentRate,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: null,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: feedback.fdb.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(30),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: wy,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text(feedData[index].teename),
                                    Text(feedData[index].subject),
                                    Text(feedData[index].feed),
                                    Text(feedData[index].rate.toString()),
                                    RatingBar.builder(
                                      initialRating: feedData[index].rate,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: null,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        },
      );
    } else {
      return Loading();
    }
  }
}
