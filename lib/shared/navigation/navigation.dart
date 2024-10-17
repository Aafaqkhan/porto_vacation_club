import 'dart:async';

import 'package:flutter/material.dart';

import 'navigator_key.dart';

class Navigation {
  static pushNamed(String routeName,
          {bool rootNavigator = false, Object? arguments}) =>
      Navigator.of(appContext, rootNavigator: rootNavigator)
          .pushNamed(routeName, arguments: arguments);
  static pushReplacementNamed(String routeName,
          {bool rootNavigator = false, Object? arguments}) =>
      Navigator.of(appContext, rootNavigator: rootNavigator)
          .pushReplacementNamed(routeName, arguments: arguments);
  static pushNamedAndRemoveUntil(String routeName,
          {bool rootNavigator = false, Object? arguments}) =>
      Navigator.of(appContext, rootNavigator: rootNavigator)
          .pushNamedAndRemoveUntil(routeName, (route) => false,
              arguments: arguments);
  static pop({bool rootNavigator = false, int delay = 0}) => Timer(
      Duration(milliseconds: delay),
      () => Navigator.of(appContext, rootNavigator: rootNavigator).pop());
static  String currentScreen() {
    // return ModalRoute.of(appContext)?.settings.name ?? '';
    return '';
  //  return Router.of(appContext).routeInformationProvider?.value.location??'';
  }
}
