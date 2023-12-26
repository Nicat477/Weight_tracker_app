import 'package:flutter/material.dart';
import 'package:weight_tracker_app/add_record.dart';
import 'package:weight_tracker_app/history.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'graph.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  Widget _currentScreen = GraphScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _currentScreen,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(() => AddRecordView());
          },
          backgroundColor: Colors.black,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
            height: Get.height / 12,
            gapLocation: GapLocation.center,
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            backgroundColor: Colors.black,
            icons: [Icons.show_chart, Icons.history],
            iconSize: 30,
            activeIndex: _currentTab,
            onTap: (int) {
              setState(() {
                _currentTab = int;
                _currentScreen = (int == 0) ? GraphScreen() : HistoryScreen();
              });
            }));
  }
}
