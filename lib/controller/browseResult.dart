import 'dart:ui';
import 'package:cikguu_app/controller/browseDetails.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrowseResult extends StatefulWidget {
  final String exam;
  final String subject;

  BrowseResult({Key key, this.exam, this.subject});
  @override
  _BrowseResultState createState() => _BrowseResultState();
}

class _BrowseResultState extends State<BrowseResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('subjects')
            .document(widget.exam)
            .collection(widget.subject)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Sorry no tutor available for this subject'),
            );
          } else {
            return ListView(
              children: snapshot.data.documents.map((document) {
                print('trying to see tutor id');
                print(document.documentID);
                return Center(
                  child: Container(
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BrowseDetails(
                                      idTutor: document.documentID,
                                    )),
                          );
                        },
                        child: Row(
                          children: <Widget>[
                            ClipOval(
                              child: SizedBox(
                                height: 200.0,
                                width: 100.0,
                                child: Image.network(
                                  document['img'],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text(document['name']),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
