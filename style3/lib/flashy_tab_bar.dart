import 'package:flutter/material.dart';

import 'package:flashy_tab_bar/flashy_tab_bar.dart';
import 'package:style3/screens/account.dart';
import 'package:style3/screens/home.dart';
import 'package:style3/screens/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  Widget _child;


  @override
  void initState() {
    _child = HomeContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        body: _child,
        bottomNavigationBar: FlashyTabBar(
          animationCurve: Curves.linear,
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            _handleNavigationChange(_selectedIndex);
          }),
          items: [
            FlashyTabBarItem(
              activeColor: Colors.indigo,
              inactiveColor: Colors.pink,
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.indigo,
              inactiveColor: Colors.pink,
              icon: Icon(Icons.account_circle),
              title: Text('Account'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.indigo,
              inactiveColor: Colors.pink,
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],

        ),
      ),
    );
  }
  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeContent();
          break;
        case 1:
          _child = AccountContent();
          break;
        case 2:
          _child = SettingsContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
