import 'package:flutter/material.dart';

class CarePlusScreen extends StatefulWidget {
  @override
  _CarePlusScreenState createState() => _CarePlusScreenState();
}

class _CarePlusScreenState extends State<CarePlusScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Text(
          'Coming Soon!',
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}