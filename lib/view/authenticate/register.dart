import 'package:cikguu_app/controller/auth.dart';
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
  String usertype = '';
  int userT;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(Icons.person),
            label: Text('Signin'),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                //name
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Full Name'),
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
                  decoration: InputDecoration(hintText: 'Phone Number'),
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
                  decoration: InputDecoration(hintText: 'Email'),
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
                  decoration: InputDecoration(hintText: 'Password'),
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
                    hint: Text('Select Role'),
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
                          usertype = 'tutor';
                        } else {
                          usertype = 'tutee';
                        }
                      });
                    }),
                //sign in button
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          usertype, name, phone, email, password);
                      if (result == null) {
                        setState(() => error = 'Email invalid');
                      }
                    }
                  },
                  color: Colors.purple,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
