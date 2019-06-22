import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rovo_app/configs/themes.dart';

class AppProvider with ChangeNotifier{
  BaseTheme curTheme;

  AppProvider(){
    curTheme = LightTheme();
  }

  // Change theme
  void switchTheme() {
    curTheme = curTheme.switchTheme();
    notifyListeners();
  }


}