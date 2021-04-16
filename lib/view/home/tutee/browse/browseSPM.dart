import 'package:cikguu_app/controller/browseResult.dart';
import 'package:flutter/material.dart';

class BrowseSPM extends StatefulWidget {
  @override
  _BrowseSPMState createState() => _BrowseSPMState();
}

class _BrowseSPMState extends State<BrowseSPM> {
  String exam = 'spm';
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      childAspectRatio: 2.0,
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        //biology
        OutlineButton(
          child: new Text("Biology"),
          borderSide: BorderSide(
            color: Colors.purple,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    BrowseResult(exam: exam, subject: 'biology'),
              ),
            );
          },
        ),
        //chemistry
        OutlineButton(
          child: new Text("Chemistry"),
          borderSide: BorderSide(
            color: Colors.purple,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BrowseResult(exam: exam, subject: 'chemistry')),
            );
          },
        ),
        //physic
        OutlineButton(
          child: new Text("Physic"),
          borderSide: BorderSide(
            color: Colors.purple,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BrowseResult(exam: exam, subject: 'physic')),
            );
          },
        ),
        //mathematics
        OutlineButton(
          child: new Text("Mathematics"),
          borderSide: BorderSide(
            color: Colors.purple,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BrowseResult(exam: exam, subject: 'mathematics')),
            );
          },
        ),
      ],
    ));
  }
}
