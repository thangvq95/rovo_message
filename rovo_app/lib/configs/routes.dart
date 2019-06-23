import 'package:flutter/material.dart';
import 'package:rovo_app/ui/algorithm_page.dart';
import 'package:rovo_app/ui/home.dart';
import 'package:rovo_app/ui/message_page.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Navigation.HomePage:
      return buildRoute(settings, HomePage());
    case Navigation.MessagePage:
      return buildRoute(settings, MessagePage());
    case Navigation.AlgorithmPage:
      return buildRoute(settings, AlgorithmPage());
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
  static const String AlgorithmPage = "/AlgorithmPage";
}