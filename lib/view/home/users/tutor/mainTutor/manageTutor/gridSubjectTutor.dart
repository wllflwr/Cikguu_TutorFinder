import 'package:cikguu_app/model/global.dart';
import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/subjectdata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/subject.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectOptions extends StatefulWidget {
  //const SubjectOptions({ Key? key }) : super(key: key);
  final GridLayout subjectName;
  final bool subjectState;
  SubjectOptions({
    this.subjectName,
    this.subjectState,
  });

  @override
  _SubjectOptionsState createState() => _SubjectOptionsState();
}

class _SubjectOptionsState extends State<SubjectOptions> {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    bool subState = widget.subjectState;
    print(widget.subjectName.eng);
    print(subState);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: FilterChip(
          backgroundColor: subState ? gn : rd,
          selected: subState,
          label: Text(widget.subjectName.eng),
          //avatar: Text('W'),
          onSelected: (bool selected) async {
            setState(() {
              subState = !subState;
            });
            if (subState) {
              // add in subject collection
              await SubjectDataService(uid: profile.uid).addSubjectTutorSPM(
                  profile.fullName,
                  profile.image,
                  widget.subjectName.eng.toLowerCase());

              // add in profile collection
              await ProfileDataService(uid: profile.uid)
                  .updateSubject(widget.subjectName.eng.toLowerCase());
            } else {
              // remove in profile collection
              await SubjectDataService(uid: profile.uid)
                  .deleteSubjectTutorSPM(widget.subjectName.eng.toLowerCase());

              // remove from profile subject array
              await ProfileDataService(uid: profile.uid)
                  .deleteSubject(widget.subjectName.eng.toLowerCase());
            }
          }),
    );
  }
}
