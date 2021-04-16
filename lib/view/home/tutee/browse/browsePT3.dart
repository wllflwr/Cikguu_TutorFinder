import 'package:cikguu_app/controller/browseResult.dart';
import 'package:flutter/material.dart';

class BrowsePT3 extends StatefulWidget {
  @override
  _BrowsePT3State createState() => _BrowsePT3State();
}

class _BrowsePT3State extends State<BrowsePT3> {
  String exam = 'pt3';
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
        OutlineButton(
          child: new Text("English"),
          borderSide: BorderSide(
            color: Colors.purple,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BrowseResult(exam: exam, subject: 'english')),
            );
          },
        ),
        OutlineButton(
          child: new Text("Bahasa Melayu"),
          borderSide: BorderSide(
            color: Colors.purple,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BrowseResult(exam: exam, subject: 'bahasa melayu')),
            );
          },
        ),
        OutlineButton(
          child: new Text("Science"),
          borderSide: BorderSide(
            color: Colors.purple,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BrowseResult(exam: exam, subject: 'science')),
            );
          },
        ),
      ],
    ));
  }
}
