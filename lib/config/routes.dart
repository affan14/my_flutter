import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter/constants/navigations.dart';
import 'package:my_flutter/home.dart';
import 'package:my_flutter/pages/carroussel.dart';
import 'package:my_flutter/splash.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.HOME:
      return buildRoute(settings, HomePage());
    case AppRoutes.CARROUSSEL:
      return buildRoute(settings, Carroussel());
    default:
      return buildRoute(settings, Splash());
  }
}

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
      settings: settings, builder: (BuildContext context) => builder);
}
