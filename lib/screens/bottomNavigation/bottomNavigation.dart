import 'package:flutter/material.dart';
import 'package:covidsafe/screens/explore/explore.dart';
import 'package:covidsafe/screens/shops/shops.dart';
import 'package:covidsafe/screens/carePlus/carePlus.dart';
import 'package:covidsafe/themes/themes.dart';
import 'package:covidsafe/widgets/Settings.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentScreenIndex = 0;

  final _navigationTab = [ExploreScreen(), ShopsScreen(), CarePlusScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes().themeBackgroundColor(context),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _navigationTab[_currentScreenIndex],
              Positioned(
                right: 0,
                top: 60,
                child: Settings(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 26,
        selectedItemColor: Themes().primaryColor,
        unselectedItemColor: Themes().getSecondaryColor(context),
        backgroundColor: Themes().themeBackgroundColor(context),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe900, fontFamily: 'Icon Explore'),
              size: 30.0,
            ),
            title: Container(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                'Explore',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe900, fontFamily: 'Icon Shops'),
              size: 30.0,
            ),
            title: Container(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                'Shops',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconData(0xe900, fontFamily: 'Icon Care Plus'),
              size: 30.0,
            ),
            title: Container(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                'Care+',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
      ),
    );
  }
}
