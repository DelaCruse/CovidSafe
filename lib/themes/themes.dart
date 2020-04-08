import 'package:flutter/material.dart';

class Themes {
  Color get primaryColor => Color(0xFFD800FF);
  final Color _darkThemeSecondaryColor = Color(0xFFC7BEBE);
  final Color _lightThemeSecondaryColor = Color(0xFF585858);
  final Color _darkThemeBackgroundColor = Colors.black;
  final Color _lightThemeBackgroundColor = Color(0xFFF5F5F5);
  final Color _darkThemeExploreCardColor = Color(0xFF1C1C1C);
  final Color _lightThemeExploreCardColor = Colors.white;
  Color get lowRiskColor => Color(0xFF5ABC2E);
  Color get moderateRiskColor => Color(0xFFED852B);
  Color get highRiskColor => Color(0xFFFF0000);



  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      accentColor: primaryColor
    );
  }

  Color themeBackgroundColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? _darkThemeBackgroundColor
        : _lightThemeBackgroundColor;
  }

  Color getSecondaryColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? _darkThemeSecondaryColor
        : _lightThemeSecondaryColor;
  }

  Color getExploreCardColor(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? _darkThemeExploreCardColor
        : _lightThemeExploreCardColor;
  }

  ImageProvider getExploreBg(context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? AssetImage('assets/graphics/exploreBgDark.png')
        : AssetImage('assets/graphics/exploreBg.png');
  }

  ImageProvider getPoweredByGoogle(context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark
        ? AssetImage('assets/graphics/powered_by_google_on_non_white.png')
        : AssetImage('assets/graphics/powered_by_google_on_white.png');
  }
}
