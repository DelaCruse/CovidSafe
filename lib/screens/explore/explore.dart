import 'package:covidsafe/screens/explore/widgets.dart';
import 'package:covidsafe/themes/themes.dart';
import 'package:covidsafe/widgets/customStaticWidgets.dart';
import 'package:covidsafe/widgets/location.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
        top: -40,
        right: -100,
        child: Image(
          image: Themes().getExploreBg(context),
          height: 326,
          width: 326,
        ),
      ),
      Container(
        child: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60),
              CustomStaticWidgets().pageHeading('Know\nYour Area.'),
              SizedBox(height: 16.0),
              CustomStaticWidgets().pageSubHeading(context,
                  "Get notified when you're around\nvulnerable areas of COVID-19"),
              SizedBox(height: 40.0),
              Location(),
              SizedBox(height: 50.0),
              RiskCard(),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    ]);
  }
}

class RiskCard extends StatefulWidget {
  @override
  _RiskCardState createState() => _RiskCardState();
}

class _RiskCardState extends State<RiskCard> {
  String riskLevel = 'LOW';
  Map<String, Color> riskColors = {'LOW': Themes().lowRiskColor};
  Map<String, int> cases = {
    'One km': 0,
    'Five km': 1,
    'Ten km': 4,
    'Twenty km': 8
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ((MediaQuery.of(context).size.width - 277) / 2) - 16,
          right: (MediaQuery.of(context).size.width - 277) / 2),
      width: 277,
      height: 272,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(22.0)),
        color: Themes().getExploreCardColor(context),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 24.0),
          Widgets().cardHeading(),
          SizedBox(height: 24.0),
          Text(
            riskLevel,
            style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
                color: riskColors[riskLevel]),
          ),
          SizedBox(height: 24.0),
          Text('Cases within',
              style: TextStyle(
                fontSize: 14.0,
                color: Themes().getSecondaryColor(context),
              )),
          SizedBox(height: 12.0),
          Widgets().cases(context, cases),
        ],
      ),
    );
  }
}
