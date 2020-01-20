import 'package:common_bottom_navigation_bar/components/common_navigation_bar.dart';
import 'package:common_bottom_navigation_bar/screens/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants.dart';
import '../pages/calendar_page.dart';
import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.home,
              color: kGoodLightGray,
            ),
            title: Text('HOME'),
            activeIcon: Icon(
              Feather.home,
              color: kGoodPurple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.calendar,
              color: kGoodLightGray,
            ),
            title: Text('CALENDAR'),
            activeIcon: Icon(
              FontAwesome.calendar,
              color: kGoodPurple,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              EvilIcons.user,
              color: kGoodLightGray,
              size: 36,
            ),
            title: Text('PROFILE'),
            activeIcon: Icon(
              EvilIcons.user,
              color: kGoodPurple,
              size: 36,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: CommonBottomNavigationBar(
        selectedIndex: _selectedIndex,
        navigatorKeys: _navigatorKeys,
        childrens: [
          HomePage(),
          CalendarPage(
              onNext: _next,
          ),

          ProfilePage(),
        ],
      ),

    );

  }

  void _next() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
  }

}
