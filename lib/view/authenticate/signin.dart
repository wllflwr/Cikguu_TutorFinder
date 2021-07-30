import 'package:cikguu_app/controller/auth.dart';
import 'package:flutter/material.dart';

class SingIn extends StatefulWidget {
  final Function toggleView;
  SingIn({this.toggleView});

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final AuthService _auth = AuthService();

  // form validation key check
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';
  int userT;
  String usertype = '';
  Color pl = Colors.black;
  Color gn = Color(0xff22BF8D);
  Color pn = Color(0xffFF337E);
  Color yl = Color(0xffF0C742);

  final TextStyle _label = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double header = height * 0.2;
    final double body = height * 0.74;
    final double foot = height * 0.06;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Container(
        //color: yl,
        child: Column(
          children: <Widget>[
            // header
            Container(
              color: yl,
              height: header,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                ),
                height: 100,
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: body,
              //color: Colors.yellowAccent,
              decoration: BoxDecoration(
                color: yl,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  // bottomLeft: Radius.circular(40),
                  // bottomRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 50.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //email
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        //style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: _label,
                          labelText: 'Email',
                          fillColor: Colors.white,
                        ),
                        validator: (val) => val.isEmpty ? 'Enter email!' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      //password
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusColor: Colors.black,
                          labelStyle: _label,
                          labelText: 'Password',
                          //hintText: 'Email',
                          fillColor: Colors.white,
                        ),
                        validator: (val) =>
                            val.length < 6 ? 'Password too short' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),

                      //sign in button
                      SizedBox(
                        height: 100.0,
                      ),
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
                            if (_formKey.currentState.validate()) {
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() => error = 'Wrong credential');
                              }
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 18, bottom: 18),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //SizedBox(height: 5.0),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              color: yl,
              alignment: Alignment.centerRight,
              height: foot,
              width: double.infinity,
              child: FlatButton(
                //color: yl,
                onPressed: () {
                  widget.toggleView();
                },
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    color: pl,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
