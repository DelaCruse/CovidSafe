import 'package:flutter/material.dart';
import 'package:covidsafe/screens/bottomNavigation/bottomNavigation.dart';
import 'package:covidsafe/themes/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  ScrollController _scrollViewController;

  @override
  Widget build(BuildContext context) {
    _scrollViewController = new ScrollController();

    return MaterialApp(
      theme: Themes().lightTheme(),
      darkTheme: Themes().darkTheme(),
      home: BottomNavigation(),
    );
  }
}
