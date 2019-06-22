import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Themes { light, dark}
class ThemeSetting{
  Themes theme;
  BaseTheme getTheme() {
    switch (theme) {
      case Themes.dark:
        return DarkTheme();
      default:
        return LightTheme();
    }
  }
}


abstract class BaseTheme {
  Brightness get brightness;
  SystemUiOverlayStyle statusBar;

  Color get background;
  Color get backgroundDialog;
  Color get primaryColor;
  Color get accentColor;
  Color get text;
  Color get text60;
  Color get text30;
  Color get hint;
  Color get border;
}

class LightTheme extends BaseTheme {
  static const grey = Color(0xFF454868);

  @override
  Brightness get brightness => Brightness.light;
  Color get background => Color(0xFFFFFFFF);
  Color get backgroundDialog => Color(0xFFFFFFFF);
  Color get primaryColor => Colors.teal;
  Color get accentColor => Colors.teal;
  Color get text => grey.withOpacity(0.9);
  Color get text60 => grey.withOpacity(0.6);
  Color get text30 => grey.withOpacity(0.3);
  Color get hint => grey.withOpacity(0.3);
  Color get border => grey.withOpacity(0.3);

  SystemUiOverlayStyle statusBar =
  SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent);

}

class DarkTheme extends BaseTheme {
  static const white = Color(0xFFFFFFFF);
  @override
  Brightness get brightness => Brightness.light;
  Color get background => Color(0xFF1E2C3D);
  Color get backgroundDialog => Color(0xFF2A3A4D);
  Color get primaryColor => Color(0xFFA3CDFF);
  Color get accentColor => Color(0xFFA3CDFF).withOpacity(0.1);
  Color get text => white.withOpacity(0.9);
  Color get text60 => white.withOpacity(0.6);
  Color get text30 => white.withOpacity(0.3);
  Color get hint => white.withOpacity(0.3);
  Color get border => white.withOpacity(0.3);

  SystemUiOverlayStyle statusBar =
  SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent);
}