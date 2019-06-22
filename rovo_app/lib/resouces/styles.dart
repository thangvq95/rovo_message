import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:rovo_app/provider/app_provider.dart';

import '../service_locator.dart';

class AppStyles {

  // Text style for setting item header
  static TextStyle textStyleItemHeader() {
    return TextStyle(
      fontSize: AppFontSizes._large,
      fontWeight: FontWeight.w600,
      color: getIt<AppProvider>().curTheme.text,
    );
  }

  // Text style for input form message
  static TextStyle textStyleItemInputMessage() {
    return TextStyle(
      fontSize: AppFontSizes.medium,
      fontWeight: FontWeight.w400,
      color: getIt<AppProvider>().curTheme.text,
    );
  }

  // Text style for normal
  static TextStyle textStyleItem() {
    return TextStyle(
      fontSize: AppFontSizes.medium,
      fontWeight: FontWeight.w400,
      color: getIt<AppProvider>().curTheme.text,
    );
  }

  // Text style for name of user
  static TextStyle textStyleSubItem() {
    return TextStyle(
      fontSize: AppFontSizes.smallest,
      fontWeight: FontWeight.w300,
      color: getIt<AppProvider>().curTheme.text60,
    );
  }

  // Text style for accent
  static TextStyle textStyleItemAccent() {
    return TextStyle(
      fontSize: AppFontSizes.medium,
      fontWeight: FontWeight.w400,
      color: getIt<AppProvider>().curTheme.textAccent,
    );
  }

}


class AppFontSizes {
  static const smallest = 12.0;
  static const small = 14.0;
  static const medium = 16.0;
  static const _large = 20.0;
  static const larger = 24.0;
  static const _largest = 28.0;
  static const _sslarge = 18.0;
  static const _sslargest = 22.0;
  static double largest(context) {
    if (smallScreen(context)) {
      return _sslargest;
    }
    return _largest;
  }
  static double large(context) {
    if (smallScreen(context)) {
      return _sslarge;
    }
    return _large;
  }
  static double smallText(context) {
    if (smallScreen(context)) {
      return smallest;
    }
    return small;
  }
}

bool smallScreen(BuildContext context) {
  if (MediaQuery.of(context).size.height < 667)
    return true;
  else
    return false;
}