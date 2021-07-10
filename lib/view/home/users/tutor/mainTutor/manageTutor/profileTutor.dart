import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/manageTutor/imageTutor.dart';
//import 'package:cikguu_app/view/home/users/tutor/manageTutor/imageTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTutor extends StatefulWidget {
  @override
  _ProfileTutorState createState() => _ProfileTutorState();
}

class _ProfileTutorState extends State<ProfileTutor> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _phone = '';
  String _bio = '';
  String _address = '';
  String _education = '';
  String _extra = '';

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    Profile clone = profile;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile Setting'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              //image
              RaisedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageTutor()),
                );
              }),
              // name
              Text('Name'),
              TextFormField(
                initialValue: profile.fullName,
                onChanged: (val) {
                  print('name' + val);
                  setState(() {
                    if (val == null) {
                      _name = profile.fullName;
                    } else {
                      _name = val;
                    }
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),

              //phone number
              Text('Phone Number'),
              TextFormField(
                initialValue: profile.phoneNumber,
                onChanged: (val) {
                  setState(() => _phone = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),

              //bio
              Text('Bio'),
              TextFormField(
                initialValue: profile.bio,
                onChanged: (val) {
                  setState(() => _bio = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),

              //address
              Text('Address'),
              TextFormField(
                initialValue: profile.address,
                onChanged: (val) {
                  setState(() => _address = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),

              //education
              Text('Education'),
              TextFormField(
                initialValue: profile.education,
                onChanged: (val) {
                  print(val);
                  setState(() => _education = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),

              //experience
              Text('Experience'),
              TextFormField(
                initialValue: profile.extraInfo,
                onChanged: (val) {
                  print(val);
                  setState(() => _extra = val);
                },
              ),
              SizedBox(
                height: 20.0,
              ),

              // save button
              RaisedButton(
                onPressed: () async {
                  print(clone.phoneNumber);

                  if (_name.isEmpty) _name = profile.fullName;
                  if (_bio.isEmpty) _bio = profile.bio;
                  if (_phone.isEmpty) _phone = profile.phoneNumber;
                  if (_address.isEmpty) _address = profile.address;
                  if (_education.isEmpty) _education = profile.education;
                  if (_extra.isEmpty) _extra = profile.extraInfo;

                  await ProfileDataService(uid: profile.uid).updateProfileData(
                    _name,
                    _bio,
                    _phone,
                    _address,
                    _education,
                    _extra,
                  );
                  Navigator.pop(context);
                },
                color: Colors.blue,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
