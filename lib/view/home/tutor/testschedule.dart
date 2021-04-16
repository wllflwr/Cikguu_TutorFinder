import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:intl/intl.dart';

class TestSchedule extends StatefulWidget {
  @override
  _TestScheduleState createState() => _TestScheduleState();
}

class _TestScheduleState extends State<TestSchedule> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    //prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  /*
  static DateTime today = DateTime.now();
  int day = today.day;
  List<int> week = [];

  final imageList = [
    'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246__480.jpg',
    'https://cdn.pixabay.com/photo/2016/11/20/09/06/bowl-1842294__480.jpg',
    'https://cdn.pixabay.com/photo/2017/01/03/11/33/pizza-1949183__480.jpg',
    'https://cdn.pixabay.com/photo/2017/02/03/03/54/burger-2034433__480.jpg',
  ]; */

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(Icons.add),
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: Colors.white70,
                          title: Text("Add Events"),
                          content: TextField(
                            controller: _eventController,
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (_eventController.text.isEmpty) return;
                                setState(() {
                                  if (_events[_controller.selectedDay] !=
                                      null) {
                                    _events[_controller.selectedDay]
                                        .add(_eventController.text);
                                  } else {
                                    _events[_controller.selectedDay] = [
                                      _eventController.text
                                    ];
                                  }
                                  prefs.setString("events",
                                      json.encode(encodeMap(_events)));
                                  _eventController.clear();
                                  Navigator.pop(context);
                                });
                              },
                            )
                          ],
                        ));
              },
            ),
            body: Column(
              children: <Widget>[
                TableCalendar(
                  calendarController: _controller,
                  initialCalendarFormat: CalendarFormat.week,
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                    todayDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                ..._selectedEvents.map((event) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                            child: Text(
                          event,
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ),
                    )),
              ],
            )),
      ),
    );

    /*
    for (int a = 0; a < 7; a++) {
      week[a] = day;
      day++;
    } 
    return Swiper(
      control: SwiperControl(
        color: Colors.purple,
      ),
      itemCount: week.length,
      itemBuilder: (context, index) {
        print(week[index]);
        return Card(
          child: Text(week[index].toString()),
        );
      },
    ); */
  }
}
