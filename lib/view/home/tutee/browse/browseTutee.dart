import 'package:cikguu_app/view/home/tutee/browse/browsePT3.dart';
import 'package:cikguu_app/view/home/tutee/browse/browseSPM.dart';
import 'package:flutter/material.dart';

class BrowseTutee extends StatefulWidget {
  @override
  _BrowseTuteeState createState() => _BrowseTuteeState();
}

class _BrowseTuteeState extends State<BrowseTutee>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'SPM',
            ),
            Tab(
              text: 'PT3',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          //SPM
          BrowseSPM(),

          //PT3
          BrowsePT3()
        ],
      ),
    );
  }
}
