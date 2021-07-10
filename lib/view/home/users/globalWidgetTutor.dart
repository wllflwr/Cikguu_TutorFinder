import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cikguu_app/model/global.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.hd,
    @required this.bl,
    @required this.wy,
  }) : super(key: key);

  final String hd;
  final Color bl;
  final Color wy;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Feather.chevron_left,
            color: bl,
            size: 35,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: wy,
        title: Text(
          hd,
          style: TextStyle(
            color: bl,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(40))));
  }
}
