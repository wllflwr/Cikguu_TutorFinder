import 'package:cikguu_app/controller/auth.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/homeTutor/homeTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/manageTutor/subjectTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/scheduleTutor/scheduleTutor.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/scheduleTutor/testSchedule.dart';
import 'package:cikguu_app/view/home/users/tutor/mainTutor/sessionTutor/testwrapperTutor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DashboardTutor extends StatefulWidget {
  //const DashboardTutor({ Key? key }) : super(key: key);

  @override
  _DashboardTutorState createState() => _DashboardTutorState();
}

class _DashboardTutorState extends State<DashboardTutor> {
  Color yl = Color(0xffF0C742);
  Color wy = Colors.white;
  Color bl = Colors.black;

  TextStyle menu = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final profile = Provider.of<Profile>(context);

    final double height = MediaQuery.of(context).size.height;
    final double top = height * 0.6;
    final double bottom = height * 0.4;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            //top
            Container(
              height: top,
              decoration: BoxDecoration(
                color: yl,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(45),
                ),
              ),
              padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: Column(
                children: <Widget>[
                  // logout section
                  _LogoutSection(yl: yl, auth: _auth),

                  _ProfileSection(wy: wy, profile: profile),

                  // sub menu
                  SizedBox(height: 30),
                  _MenuSection(wy: wy, menu: menu),
                ],
              ),
            ),

            //tutor session
            _TutorSection(bottom: bottom, yl: yl, bl: bl, menu: menu),
          ],
        ),
      ),
    );
  }
}

class _TutorSection extends StatelessWidget {
  const _TutorSection({
    Key key,
    @required this.bottom,
    @required this.yl,
    @required this.bl,
    @required this.menu,
  }) : super(key: key);

  final double bottom;
  final Color yl;
  final Color bl;
  final TextStyle menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottom,
      color: yl,
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 17),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    FontAwesome.bookmark,
                    color: Colors.red[900],
                    size: 30,
                  ),
                  onPressed: null,
                ),
                Text(
                  'Tutor Session',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //pending
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: yl,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Feather.clock,
                      color: bl,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestWrapperTutor(
                            destination: 'pending',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //ongoing
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: yl,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.history,
                      color: bl,
                      size: 37,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestWrapperTutor(
                            destination: 'accept',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //unpaid
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: yl,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Feather.dollar_sign,
                      color: bl,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestWrapperTutor(
                            destination: 'unpaid',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            //menu title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    width: 55,
                    child: Text('Pending',
                        style: menu, textAlign: TextAlign.center)),
                Container(
                    width: 55,
                    child: Text('Ongoing',
                        style: menu, textAlign: TextAlign.center)),
                Container(
                    width: 55,
                    child: Text('Unpaid',
                        style: menu, textAlign: TextAlign.center)),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //complete
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: yl,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Feather.check,
                      color: bl,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestWrapperTutor(
                            destination: 'complete',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //unpaid
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: yl,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Feather.x,
                      color: bl,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestWrapperTutor(
                            destination: 'reject',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            //menu title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    width: 75,
                    child: Text('Completed',
                        style: menu, textAlign: TextAlign.center)),
                Container(
                    width: 60,
                    child: Text('Rejected',
                        style: menu, textAlign: TextAlign.center)),
              ],
            ),
          ],
        ),
        height: bottom,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
          ),
        ),
      ),
    );
  }
}

class _MenuSection extends StatelessWidget {
  const _MenuSection({
    Key key,
    @required this.wy,
    @required this.menu,
  }) : super(key: key);

  final Color wy;
  final TextStyle menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //profile
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Feather.user,
                    color: wy,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeTutor()),
                    );
                  },
                ),
              ),

              // schedule
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Feather.calendar,
                    color: wy,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScheduleTutor()),
                    );
                  },
                ),
              ),

              //subject
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Feather.book_open,
                    color: wy,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SubjectTutor()),
                    );
                  },
                ),
              ),

              // feedback
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Feather.star,
                    color: wy,
                    size: 30,
                  ),
                  onPressed: null,
                ),
              ),
            ],
          ),
          //menu title
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: 60,
                  child: Text('Profile',
                      style: menu, textAlign: TextAlign.center)),
              Container(
                  width: 60,
                  child: Text('Schedule',
                      style: menu, textAlign: TextAlign.center)),
              Container(
                  width: 60,
                  child: Text('Subject',
                      style: menu, textAlign: TextAlign.center)),
              Container(
                  width: 63,
                  child: Text('Feedback',
                      style: menu, textAlign: TextAlign.center)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({
    Key key,
    @required this.wy,
    @required this.profile,
  }) : super(key: key);

  final Color wy;
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
        ),
        Positioned(
          right: 13,
          child: Container(
            padding: EdgeInsets.only(left: 58),
            height: 170,
            width: 270,
            decoration: BoxDecoration(
              color: wy,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  profile.fullName,
                  style: TextStyle(fontSize: 23),
                ),
                Text(profile.bio),
                //Text(profile.phoneNumber),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 48,
          left: 10,
          child: ClipOval(
            child: SizedBox(
              height: 130.0,
              width: 130.0,
              child: Image.network(
                profile.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          right: 50,
          child: Container(
            height: 50,
            width: 180,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class _LogoutSection extends StatelessWidget {
  const _LogoutSection({
    Key key,
    @required this.yl,
    @required AuthService auth,
  })  : _auth = auth,
        super(key: key);

  final Color yl;
  final AuthService _auth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: yl,
      alignment: Alignment.centerRight,
      width: double.infinity,
      child: FlatButton(
        padding: EdgeInsets.all(20),
        //color: Colors.white,
        onPressed: () async {
          await _auth.signOut();
        },
        child: Text(
          'LOGOUT',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
