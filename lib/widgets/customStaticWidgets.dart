import 'package:covidsafe/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomStaticWidgets {

  Widget pageHeading(String heading) {
    return Text(
      heading,
      style: TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.w600,
          color: Themes().primaryColor),
    );
  }

  Widget pageSubHeading(BuildContext context, String heading) {
    return Text(
      heading,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Themes().getSecondaryColor(context),
        height: 1.7,
      ),
    );
  }
}
