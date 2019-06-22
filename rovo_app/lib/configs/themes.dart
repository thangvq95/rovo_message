import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseTheme {
  Brightness get brightness;
  SystemUiOverlayStyle statusBar;

  Color get background;
  Color get cardBackground;
  Color get backgroundDialog;
  Color get primaryColor;
  Color get cardColor;
  Color get text;
  Color get text60;
  Color get text30;
  Color get textAccent;
  Color get hint;
  Color get border;

  BaseTheme switchTheme(){
    if(this is LightTheme){
      return DarkTheme();
    }else
      return LightTheme();
  }
}

class LightTheme extends BaseTheme {
  static const grey = Color(0xFF454868);

  @override
  Brightness get brightness => Brightness.light;
  Color get background => Color(0xFFFFFFFF);
  Color get cardBackground => Color(0xFFEDEFF0);
  Color get backgroundDialog => Color(0xFFFFFFFF);
  Color get primaryColor => Colors.teal;
  Color get cardColor => Colors.teal;
  Color get text => grey.withOpacity(0.9);
  Color get text60 => grey.withOpacity(0.6);
  Color get text30 => grey.withOpacity(0.3);
  Color get textAccent => Color(0xFFFFFFFF).withOpacity(0.9);
  Color get hint => grey.withOpacity(0.3);
  Color get border => grey.withOpacity(0.3);

  SystemUiOverlayStyle get statusBar => SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: primaryColor);

}

class DarkTheme extends BaseTheme {
  static const white = Color(0xFFFFFFFF);
  @override
  Brightness get brightness => Brightness.dark;
  Color get background => Color(0xFF1E2C3D);
  Color get cardBackground => Color(0xFF2A3A4D);
  Color get backgroundDialog => Color(0xFF2A3A4D);
  Color get primaryColor => Color(0xFFA3CDFF);
  Color get cardColor => Color(0xFFA3CDFF).withOpacity(0.1);
  Color get text => white.withOpacity(0.9);
  Color get text60 => white.withOpacity(0.6);
  Color get text30 => white.withOpacity(0.3);
  Color get textAccent => Color(0x525459).withOpacity(0.9);
  Color get hint => white.withOpacity(0.3);
  Color get border => white.withOpacity(0.3);

  SystemUiOverlayStyle get statusBar => SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.transparent);
}