import 'package:flutter/material.dart';

import '../../domain/api_models/theme_model.dart';
import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';

class ThemeConstants {
  static const String theme = 'THEME';
  static List<ThemeModel> themes = [
    ThemeModel(
        themeTitle: 'Light', themeColor: Colors.white, themeData: lightTheme),
    ThemeModel(themeTitle: 'Dark', themeColor: Colors.black, themeData: darkTheme),
  ];
}
