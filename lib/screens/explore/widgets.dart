import 'package:covidsafe/themes/themes.dart';
import 'package:flutter/material.dart';

class Widgets {
  Widget cardHeading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'COVID-19 Risk Level',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconData(0xe900, fontFamily: 'Icon Question'),
            size: 20.0,
            color: Themes().primaryColor,
          ),
        )
      ],
    );
  }

  Widget cases(BuildContext context, Map<String, int> cases) {
    List<Widget> casesWidgetList = [];

    for (var entry in cases.entries) {
      casesWidgetList.add(RichText(
        text: TextSpan(
          text: entry.key + ': ',
          style: TextStyle(
              fontSize: 16.0, color: Themes().getSecondaryColor(context)),
          children: <TextSpan>[
            TextSpan(
                text: entry.value.toString(),
                style: TextStyle(color: Themes().primaryColor)),
          ],
        ),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            casesWidgetList[0],
            casesWidgetList[1],
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            casesWidgetList[2],
            casesWidgetList[3],
          ],
        )
      ],
    );
  }
}
