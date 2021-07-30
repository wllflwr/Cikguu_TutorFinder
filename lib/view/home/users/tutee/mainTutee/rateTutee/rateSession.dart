import 'package:cikguu_app/model/global.dart';
import 'package:cikguu_app/view/home/users/globalWidgetTutor.dart';
import 'package:flutter/material.dart';

class RateSession extends StatefulWidget {
  //const RateSession({ Key? key }) : super(key: key);

  @override
  _RateSessionState createState() => _RateSessionState();
}

class _RateSessionState extends State<RateSession> {
  final String hd = 'Feedback';

  // form validation key check
  final _formKey = GlobalKey<FormState>();

  final TextStyle _label = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  String fd;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: <Widget>[
          Container(
            color: wy,
            margin: EdgeInsets.only(left: 30, right: 30),
            padding: EdgeInsets.only(left: 30, right: 30),
            child: TextFormField(
              maxLines: 10,
              decoration: InputDecoration(
                labelStyle: _label,
                labelText: 'Enter your feedback about the tutor',
              ),
              validator: (val) =>
                  val.isEmpty ? 'You cannot submit empty form!' : null,
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                color: Colors.black,
                child: Container(
                  padding: EdgeInsets.only(top: 18, bottom: 18),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                onPressed: () {
                  // if (_formKey.currentState.validate()) {
                  //   dynamic result = await _auth.registerWithEmailAndPassword(
                  //       usertype, name, phone, email, password);

                  //   if (result == null) {
                  //     setState(() => error = 'Email invalid');
                  //   }
                  // }
                },
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
