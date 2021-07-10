import 'package:flutter/material.dart';
import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class ProfileTutee extends StatefulWidget {
  @override
  _ProfileTuteeState createState() => _ProfileTuteeState();
}

class _ProfileTuteeState extends State<ProfileTutee> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _phone = '';
  String _bio = '';
  String _address = '';
  String _education = '';
  String _extra = '';

  Color yl = Color(0xffF0C742);
  Color wy = Colors.white;
  Color bl = Colors.black;

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<Profile>(context);
    Profile clone = profile;
    //print(profile.image);

    final double height = MediaQuery.of(context).size.height;
    final double header = height * 0.15;

    return Scaffold(
      backgroundColor: yl,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: _Appbar(bl: bl, wy: wy),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: wy,
          child: Container(
            decoration: BoxDecoration(
              color: yl,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //image
                  // RaisedButton(onPressed: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => ImageTutee()),
                  //   );
                  // }),
                  // name
                  Container(
                      child: Text(
                    'Name',
                    style: TextStyle(),
                  )),
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
                  SizedBox(height: 20.0),

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
                  Text('Examination'),
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

                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      color: Colors.black,
                      onPressed: () async {
                        print(clone.phoneNumber);

                        if (_name.isEmpty) _name = profile.fullName;
                        if (_bio.isEmpty) _bio = profile.bio;
                        if (_phone.isEmpty) _phone = profile.phoneNumber;
                        if (_address.isEmpty) _address = profile.address;
                        if (_education.isEmpty) _education = profile.education;
                        if (_extra.isEmpty) _extra = profile.extraInfo;

                        await ProfileDataService(uid: profile.uid)
                            .updateProfileData(
                          _name,
                          _bio,
                          _phone,
                          _address,
                          _education,
                          _extra,
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
  }) : super(key: key);

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
          'MANAGE PROFILE',
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
