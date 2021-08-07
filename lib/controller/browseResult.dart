import 'dart:ui';
import 'package:cikguu_app/controller/browseDetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BrowseResult extends StatefulWidget {
  final String exam;
  final String subject;

  BrowseResult({Key key, this.exam, this.subject});
  @override
  _BrowseResultState createState() => _BrowseResultState();
}

class _BrowseResultState extends State<BrowseResult> {
  // stylinggg
  final Color yl = Color(0xffF0C742);
  final Color wy = Colors.white;
  final Color bl = Colors.black;
  final TextStyle torName =
      new TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold);
  final TextStyle subText = new TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yl,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: _Appbar(bl: bl, wy: wy, sb: widget.subject),
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
          child: StreamBuilder(
            stream: Firestore.instance
                .collection('subjects')
                .document(widget.exam)
                .collection(widget.subject)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data.documents.map((document) {
                    //print('trying to see tutor id');
                    //print(document.documentID);
                    return Container(
                      color: yl,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                        child: RaisedButton(
                            padding: EdgeInsets.all(20),
                            color: wy,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      document['name'],
                                      style: torName,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'RM' +
                                          document['price'].toStringAsFixed(2) +
                                          ' /hour',
                                      style: subText,
                                    ),
                                  ],
                                ),
                                ClipOval(
                                  child: SizedBox(
                                    height: 100.0,
                                    width: 100.0,
                                    child: Image.network(
                                      document['img'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0))),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BrowseDetails(
                                          idTutor: document.documentID,
                                          subject: widget.subject,
                                        )),
                              );
                            }),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return Center(
                  child: Text('Sorry no tutor available for this subject'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _Appbar extends StatelessWidget {
  const _Appbar({
    Key key,
    @required this.bl,
    @required this.wy,
    @required this.sb,
  }) : super(key: key);

  final Color bl;
  final Color wy;
  final String sb;

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
          sb.toUpperCase(),
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
