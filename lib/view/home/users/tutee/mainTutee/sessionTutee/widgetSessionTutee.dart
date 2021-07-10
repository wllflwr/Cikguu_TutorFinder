import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:flutter/material.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:cikguu_app/model/global.dart';

class NoSession extends StatelessWidget {
  const NoSession({
    Key key,
    @required this.hd,
    @required this.yl,
    @required this.bl,
    @required this.wy,
  }) : super(key: key);

  final String hd;
  final Color yl;
  final Color bl;
  final Color wy;

  @override
  Widget build(BuildContext context) {
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
            child: Center(
                heightFactor: 10.0,
                child: Text('No ' + hd.toLowerCase() + ' session'))),
      ),
    );
  }
}

class ProfileDisplay extends StatelessWidget {
  const ProfileDisplay({
    Key key,
    @required this.snapshot,
    @required this.sessionData,
    @required this.index,
  }) : super(key: key);

  final List<Session> sessionData;
  final AsyncSnapshot<Profile> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipOval(
            child: SizedBox(
              height: 85.0,
              width: 85.0,
              child: Image.network(
                snapshot.data.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 180,
            padding: EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(snapshot.data.fullName, style: nm),
                Text(sessionData[index].date + ' ' + sessionData[index].day),
                Text(
                  sessionData[index].slot.toString(),
                ),
                Text(sessionData[index].venue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
