import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:workout_app/pages/home_page.dart';
import 'package:workout_app/pages/other_page.dart';
import 'package:workout_app/pages/running_page.dart';

class HidenDrawer extends StatefulWidget {
  const HidenDrawer({super.key});

  @override
  State<HidenDrawer> createState() => _HidenDrawerState();
}

class _HidenDrawerState extends State<HidenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  
  final myTextStyle = TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:18,
          color: Colors.white
        );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Gym Workout',
        baseStyle: myTextStyle,
        selectedStyle: TextStyle(),
      ),
       HomePage()
       ),
      ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Running Workout',
        baseStyle: myTextStyle,
        selectedStyle: TextStyle(),
      ),
       RunningPage()
       ),
      ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Other Workout',
        baseStyle: myTextStyle,
        selectedStyle: TextStyle(),
      ),
       OtherPage()
       ),
    ];
  }
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.blueGrey,
      screens: _pages,
      initPositionSelected: 0,
      slidePercent: 60,
    );
  }
}