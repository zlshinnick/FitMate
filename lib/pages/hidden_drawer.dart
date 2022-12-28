import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:workout_app/pages/home_page.dart';

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
        name: 'Homepage',
        baseStyle: myTextStyle,
        selectedStyle: TextStyle(),
      ),
       HomePage()
       ),
             ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Running',
        baseStyle: myTextStyle,
        selectedStyle: TextStyle(),
      ),
       HomePage()
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