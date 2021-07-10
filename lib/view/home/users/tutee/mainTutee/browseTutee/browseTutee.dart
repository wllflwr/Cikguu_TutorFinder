import 'package:cikguu_app/controller/browseResult.dart';
import 'package:cikguu_app/model/subject.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cikguu_app/model/global.dart';

class BrowseTutee extends StatefulWidget {
  @override
  _BrowseTuteeState createState() => _BrowseTuteeState();
}

class _BrowseTuteeState extends State<BrowseTutee> {
  Color yl = Color(0xffF0C742);
  Color wy = Colors.white;
  Color bl = Colors.black;

  String exam = 'spm';
  final RoundedRectangleBorder subjCard = new RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0)));

  final TextStyle subjName = new TextStyle(fontSize: 16.0);

  var subj = {
    'Malay': 'Bahasa Melayu',
    'English': 'Bahasa Inggeris',
    'Science': 'Sains',
    'Mathematics': 'Matematik',
    'History': 'Sejarah',
    'Moral Education': 'Pendidikan Moral',
    'Islamic Education': 'Pendidikan Islam',
    'Additional Mathematics': 'Matematik Tambahan',
    'Chemistry': 'Kimia',
    'Biology': 'Biologi',
    'Physics': 'Fizik',
  };

  final _subject = [];

  //subj.forEach((k, v) => _subject.add(Subject(k, v)));

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final String hd = 'BROWSE';
    final double header = height * 0.15;
    //final double body = height * 0.74;
    //final double foot = height * 0.06;

    //subj.forEach((key, value) => _subject.add(Subject(key, value)));

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
          child: GridView.count(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            padding: EdgeInsets.all(10.0),
            children: List.generate(
              subjectList.length,
              (index) => GridOptions(
                layout: subjectList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class _Header extends StatelessWidget {
//   const _Header({
//     Key key,
//     @required this.yl,
//     @required this.header,
//     @required this.bl,
//   }) : super(key: key);

//   final Color yl;
//   final double header;
//   final Color bl;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: yl,
//       height: header,
//       child: Container(
//         padding: EdgeInsets.only(top: 15),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(40),
//           ),
//         ),
//         height: 140,
//         child: Row(
//           children: <Widget>[
//             Container(
//               child: IconButton(
//                   icon: Icon(
//                     Feather.chevron_left,
//                     color: bl,
//                     size: 35,
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   }),
//             ),
//             Center(
//               widthFactor: 2.5,
//               child: Text(
//                 'BROWSE',
//                 style: TextStyle(
//                   fontSize: 27,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// body
// Expanded(
//   child: Container(
//     color: wy,
//     child: Container(
//       padding: EdgeInsets.only(
//         top: 20,
//         left: 15,
//         right: 15,
//       ),
//       decoration: BoxDecoration(
//         color: yl,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40),
//         ),
//       ),
//       child: GridView.count(
//         childAspectRatio: 1,
//         primary: false,
//         padding: const EdgeInsets.all(15),
//         crossAxisSpacing: 23,
//         mainAxisSpacing: 23,
//         crossAxisCount: 2,
//         children: <Widget>[
//           Container(
//             child: RaisedButton(
//               shape: subjCard,
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BrowseResult(
//                         exam: exam, subject: 'biology'),
//                   ),
//                 );
//               },
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     "Biology",
//                     style: subjName,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             child: RaisedButton(
//               shape: subjCard,
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     "Chemistry",
//                     style: subjName,
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BrowseResult(
//                         exam: exam, subject: 'chemistry'),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             child: RaisedButton(
//               shape: subjCard,
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     "Physic",
//                     style: subjName,
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         BrowseResult(exam: exam, subject: 'physic'),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             child: RaisedButton(
//               shape: subjCard,
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     "Mathematics",
//                     style: subjName,
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BrowseResult(
//                         exam: exam, subject: 'mathematics'),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             child: RaisedButton(
//               shape: subjCard,
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     "Additional Mathematics",
//                     style: subjName,
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BrowseResult(
//                         exam: exam,
//                         subject: 'additional mathematics'),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Container(
//             child: RaisedButton(
//               shape: subjCard,
//               child: Column(
//                 children: <Widget>[
//                   Text(
//                     "Science",
//                     style: subjName,
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BrowseResult(
//                         exam: exam, subject: 'science'),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
