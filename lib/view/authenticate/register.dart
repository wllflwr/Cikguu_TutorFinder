import 'package:cikguu_app/controller/auth.dart';
//import 'package:cikguu_app/controller/scheduledata.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  // form validation key check
  final _formKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String name = '';
  String phone = '';
  bool usertype;
  int userT;
  String error = '';

  Color pl = Color(0xff440381);
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

      // appBar: AppBar(
      //   title: Text('Register'),
      //   backgroundColor: Colors.purColors.blacke,
      //   actions: <Widget>[
      //     FlatButton.icon(
      //       onPressed: () {
      //         widget.toggleView();
      //       },
      //       icon: Icon(Icons.person),
      //       label: Text('Signin'),
      //     )
      //   ],
      // ),
      body: Container(
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
                height: 140,
                child: Center(
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),

            //form
            Container(
              height: body,
              decoration: BoxDecoration(
                color: yl,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  // bottomLeft: Radius.circular(40),
                  // bottomRight: Radius.circular(40),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 50.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      //name

                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: _label,
                          labelText: 'Full Name',
                          fillColor: Colors.white,
                        ),
                        validator: (val) => val.isEmpty ? 'Enter name!' : null,
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                      ),

                      //phone
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: _label,
                          labelText: 'Phone Number',
                          fillColor: Colors.white,
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter phone number!' : null,
                        onChanged: (val) {
                          setState(() => phone = val);
                        },
                      ),

                      //email
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
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
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelStyle: _label,
                          labelText: 'Password',
                          fillColor: Colors.white,
                        ),
                        validator: (val) =>
                            val.length < 6 ? 'Password too short' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),

                      //user type
                      SizedBox(
                        height: 20.0,
                      ),
                      DropdownButton(
                          style: _label,
                          hint: Text(
                            'Select Role',
                            style: TextStyle(color: Colors.black),
                          ),
                          value: userT,
                          items: [
                            DropdownMenuItem(
                              child: Text('Tutor'),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text('Tutee'),
                              value: 2,
                            ),
                          ],
                          onChanged: (val) {
                            setState(() {
                              userT = val;
                              if (userT == 1) {
                                usertype = true;
                              } else {
                                usertype = false;
                              }
                            });
                          }),

                      SizedBox(
                        height: 30.0,
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
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      usertype, name, phone, email, password);

                              if (result == null) {
                                setState(() => error = 'Email invalid');
                              }
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 18, bottom: 18),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: OutlineButton(
                      //     borderSide: BorderSide(
                      //       color: Colors.black,
                      //       width: 2.0,
                      //     ),
                      //     child: Text(
                      //       'REGISTER',
                      //       style: TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 18.0,
                      //         letterSpacing: 1.5,
                      //       ),
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.only(
                      //         topRight: Radius.circular(8.0),
                      //         topLeft: Radius.circular(8.0),
                      //         bottomRight: Radius.circular(8.0),
                      //         bottomLeft: Radius.circular(8.0),
                      //       ),
                      //     ),
                      //     onPressed: () async {
                      //       if (_formKey.currentState.validate()) {
                      //         dynamic result =
                      //             await _auth.registerWithEmailAndPassword(
                      //                 usertype, name, phone, email, password);

                      //         if (result == null) {
                      //           setState(() => error = 'Email invalid');
                      //         }
                      //       }
                      //     },
                      //   ),
                      // ),
                      //sign in button

                      // FlatButton(
                      //   color: Colors.white,
                      //   onPressed: () {
                      //     widget.toggleView();
                      //   },
                      //   child: Text(
                      //     'LOGIN',
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),

                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              color: yl,
              alignment: Alignment.centerRight,
              height: foot,
              width: double.infinity,
              child: FlatButton(
                padding: EdgeInsets.all(10),
                //color: Colors.white,
                onPressed: () {
                  widget.toggleView();
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.black,
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
