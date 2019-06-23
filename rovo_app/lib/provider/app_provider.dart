import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rovo_app/configs/configs.dart';
import 'package:rovo_app/configs/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier{
  BaseTheme curTheme;

  AppProvider(){
    curTheme = LightTheme();
  }

  // Change theme
  void switchTheme() {
    curTheme = curTheme.switchTheme();
    SharedPreferences.getInstance().then((prefs){
      prefs.setBool(Configure.LIGHT_THEME_PREFER, (curTheme is LightTheme));
    });
    notifyListeners();
  }


}