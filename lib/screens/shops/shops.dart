import 'package:flutter/material.dart';

class ShopsScreen extends StatefulWidget {
  @override
  _ShopsScreenState createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
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
