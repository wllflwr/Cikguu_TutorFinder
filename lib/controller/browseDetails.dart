import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/scheduledata.dart';
import 'package:cikguu_app/controller/tutordata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/schedule.dart';
import 'package:cikguu_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BrowseDetails extends StatefulWidget {
  final String idTutor;
  final String subject;

  BrowseDetails({Key key, this.idTutor, this.subject});
  @override
  _BrowseDetailsState createState() => _BrowseDetailsState();
}

class _BrowseDetailsState extends State<BrowseDetails>
    with TickerProviderStateMixin {
  TabController _tabController;
  String day = DateFormat.E().format(DateTime.now());
  int date = DateTime.now().day;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  // booking var
  DateTime _bookDate;
  final TutorDataService _session = TutorDataService();
  final _formKey = GlobalKey<FormState>();
  String sb;
  int sl;
  String vn;
  String dt;
  String dy;

  /// This decides which day will be enabled
  /// This will be called every time while displaying day in calender.
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 30))))) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Profile',
            ),
            Tab(
              text: 'Schedule',
            ),
            Tab(
              text: 'Book',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          //profile
          StreamBuilder(
              stream: ProfileDataService(uid: widget.idTutor).profile,
              //builder: (BuildContext context, AsyncSnapshot<List<Schedule>> snapshot)
              builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: <Widget>[
                      ClipOval(
                        child: SizedBox(
                          height: 200.0,
                          width: 200.0,
                          child: Image.network(
                            snapshot.data.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text('Name'),
                        subtitle: Text(snapshot.data.fullName),
                      ),
                      ListTile(
                        title: Text('Phone Number'),
                        subtitle: Text(snapshot.data.phoneNumber),
                      ),
                      ListTile(
                        title: Text('Bio'),
                        subtitle: Text(snapshot.data.bio),
                      ),
                      ListTile(
                        title: Text('Address'),
                        subtitle: Text(snapshot.data.address),
                      ),
                      ListTile(
                        title: Text('Education'),
                        subtitle: Text(snapshot.data.education),
                      ),
                      ListTile(
                        title: Text('Experience'),
                        subtitle: Text(snapshot.data.extraInfo),
                      ),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),

          //schedule
          StreamBuilder(
              stream: ScheduleDataService(uid: widget.idTutor).schedule,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Schedule>> snapshot) {
                if (snapshot.hasData) {
                  List<Schedule> scheduleData = snapshot.data;

                  return ListView.builder(
                    itemCount: scheduleData.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Card(
                          color: scheduleData[index].id == day.toLowerCase()
                              ? Colors.pink[100]
                              : Colors.white,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text(scheduleData[index].id),
                                Center(
                                  child: Row(
                                    children: <Widget>[
                                      RaisedButton(
                                        color: scheduleData[index].slot1
                                            ? Colors.redAccent
                                            : Colors.greenAccent,
                                        onPressed: () {},
                                        child: Text(scheduleData[index]
                                            .slot1
                                            .toString()),
                                      ),
                                      RaisedButton(
                                        color: scheduleData[index].slot2
                                            ? Colors.redAccent
                                            : Colors.greenAccent,
                                        onPressed: () {},
                                        child: Text(scheduleData[index]
                                            .slot2
                                            .toString()),
                                      ),
                                      RaisedButton(
                                        color: scheduleData[index].slot3
                                            ? Colors.redAccent
                                            : Colors.greenAccent,
                                        onPressed: () {},
                                        child: Text(scheduleData[index]
                                            .slot3
                                            .toString()),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),

          //book
          Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                  key: _formKey,
                  child: ListView(children: <Widget>[
                    //subject
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      initialValue: widget.subject,
                      //decoration: InputDecoration(hintText: 'Subject'),
                      //validator: (val) => val.isEmpty ? 'Enter !' : null,
                      onChanged: (val) {
                        setState(() => sb = widget.subject);
                      },
                    ),

                    //date
                    RaisedButton(
                      child: Text(_bookDate == null
                          ? 'Pick Date'
                          : DateFormat('dd-mm-yyyy')
                              .format(_bookDate)
                              .toString()),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2022),
                          selectableDayPredicate: _decideWhichDayToEnable,
                          cancelText: 'Cancel',
                          confirmText: 'Select',
                        ).then((date) {
                          setState(() {
                            _bookDate = date;
                            //DateFormat("yyyy-MM-dd").format(DateTime.now()))
                            dt = DateFormat('dd-mm-yyyy')
                                .format(_bookDate)
                                .toString();
                            dy = _bookDate.day.toString();
                          });
                        });
                      },
                    ),
                    FlatButton(
                        onPressed: null, child: Text(_bookDate.toString())),

                    //slot
                    DropdownButton(
                        hint: Text('Select Slot'),
                        value: sl,
                        items: [
                          DropdownMenuItem(
                            child: Text('Slot 1'),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('Slot 2'),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text('Slot 3'),
                            value: 3,
                          ),
                        ],
                        onChanged: (val) {
                          setState(() {
                            sl = val;
                          });
                        }),

                    //venue
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Tutor Venue'),
                      validator: (val) =>
                          val.isEmpty ? 'Enter tutor venue!' : null,
                      onChanged: (val) {
                        setState(() => vn = val);
                      },
                    ),

                    //book button
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await _session.addTutorSession(widget.idTutor,
                              user.uid, widget.subject, dt, dy, sl, vn);
                        }
                      },
                      color: Colors.blue,
                      child: Text(
                        'Book',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ])))
        ],
      ),
    );
  }
}
