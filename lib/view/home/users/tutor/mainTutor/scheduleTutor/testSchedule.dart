import 'package:cikguu_app/model/global.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TestSchedule extends StatefulWidget {
  //const TestSchedule({ Key? key }) : super(key: key);

  @override
  _TestScheduleState createState() => _TestScheduleState();
}

class _TestScheduleState extends State<TestSchedule> {
  final String hd = 'Schedule';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Header(hd: hd, bl: bl, wy: wy),
        preferredSize: Size.fromHeight(80.0),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TimelineTile(
              afterLineStyle: LineStyle(
                color: bl,
                thickness: 3,
              ),
              //isFirst: true,
              lineXY: 0,
              indicatorStyle: IndicatorStyle(
                color: wy,
                padding: EdgeInsets.only(left: 15, right: 15),
                //width: 100,
                indicatorXY: 0.1,
                iconStyle: IconStyle(
                  color: bl,
                  iconData: Icons.check_circle_outline,
                  fontSize: 26,
                ),
              ),
              alignment: TimelineAlign.start,
              endChild: Column(
                children: <Widget>[
                  Container(
                    child: Text('Monday'),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    constraints: BoxConstraints(
                      minHeight: 100,
                    ),
                    color: Colors.lightGreenAccent,
                  ),
                ],
              ),
            ),
            TimelineTile(
              afterLineStyle: LineStyle(
                color: bl,
                thickness: 3,
              ),
              lineXY: 0,
              indicatorStyle: IndicatorStyle(
                color: bl,
                padding: EdgeInsets.only(left: 15, right: 15),
                indicatorXY: 0.1,
              ),
              alignment: TimelineAlign.start,
              endChild: Column(
                children: <Widget>[
                  Container(
                    child: Text('Monday'),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 100,
                    ),
                    color: Colors.lightGreenAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
