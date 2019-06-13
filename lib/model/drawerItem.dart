import 'package:flutter/material.dart';
import 'package:my_flutter/constants/navigations.dart';

class MenuItem {
  String title;
  IconData icon;
  String route;
  bool get isRoot => this.route == AppRoutes.HOME;
  MenuItem(this.title, this.icon, {this.route});
}
