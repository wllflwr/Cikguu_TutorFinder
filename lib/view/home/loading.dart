//import 'package:cikguu_app/view/home/users/tutee/templateTutee.dart';
import 'dart:async';

import 'package:cikguu_app/view/home/users/homewrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'dart:async';

// class Loading extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Loading..')),
//       body: Center(

//         child: SpinKitCubeGrid(
//           color: Colors.blueAccent,
//           size: 70.0,
//           duration: Duration(seconds: 3),
//         ),
//       ),
//     );
//   }
// }

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Color yl = Color(0xffF0C742);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeWrapper()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yl,
      //appBar: AppBar(title: Text('Loading..')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset('assets/Splash Screen.png'),
          )
        ],
      ),
    );
  }
}
