import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Coming Soon!',
      child: FlatButton(
        onPressed: () {},
        child: Icon(
          IconData(0xe900, fontFamily: 'Icon Settings'),
          size: 24.0,
        ),
      ),
    );
  }
}
