import 'package:flutter/material.dart';
import 'package:rovo_app/ui/home.dart';
import 'package:rovo_app/ui/message_page.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Navigation.HomePage:
      return buildRoute(settings, HomePage());
    case Navigation.MessagePage:
      return buildRoute(settings, MessagePage());
    default:
      return buildRoute(settings, HomePage());
  }
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}

class Navigation{
  // Pages routes
  static const String HomePage = "/HomePage";
  static const String MessagePage = "/MessagePage";
}