import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porto_vacation_club/shared/app_persistance/app_local.dart';
import '../shared/constants/theme_constants.dart';

final themeProvider =
    NotifierProvider<ThemeProvider, ThemeMode>(ThemeProvider.new);

class ThemeProvider extends Notifier<ThemeMode> {
  int _themeId = 0;
  @override
  ThemeMode build() {
    _themeId = AppLocal.ins.appBox.get(ThemeConstants.theme, defaultValue: 0);
    return _themeId == 0 ? ThemeMode.light : ThemeMode.dark;
  }

  toggle() {
    _themeId = 1 - _themeId;
    AppLocal.ins.appBox.put(ThemeConstants.theme, _themeId);
    state = _themeId == 0 ? ThemeMode.light : ThemeMode.dark;
  }
}
