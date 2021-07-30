import 'package:cikguu_app/controller/ratedata.dart';
import 'package:cikguu_app/model/rate.dart';
import 'package:cikguu_app/view/home/users/tutee/mainTutee/sessionTutee/historyTutee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryWrapper extends StatelessWidget {
  final String uid;
  HistoryWrapper({this.uid});
  //const HistoryWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: RateDataService(uid: uid).rating,
      builder: (BuildContext context, AsyncSnapshot<Rate> snapshot) {},
    );
  }
}
