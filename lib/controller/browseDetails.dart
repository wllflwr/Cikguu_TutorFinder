import 'package:cikguu_app/controller/profiledata.dart';
import 'package:cikguu_app/controller/scheduledata.dart';
import 'package:cikguu_app/model/profile.dart';
import 'package:cikguu_app/model/schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BrowseDetails extends StatefulWidget {
  final String idTutor;

  BrowseDetails({Key key, this.idTutor});
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

  @override
  Widget build(BuildContext context) {
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
          Text('Book here')
        ],
      ),
    );
  }
}
