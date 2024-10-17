import 'package:flutter/material.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final Color primaryColor;
  final Color secondaryColor;

  AppTheme({
    this.primaryColor = Colors.white,
    this.secondaryColor = Colors.orange,
  });

  factory AppTheme.dark() {
    return AppTheme(
      primaryColor: Colors.black,
      secondaryColor: Colors.brown,
    );
  }

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? appPrimaryColor,
    Color? appSecondaryColor,
  }) {
    return AppTheme(
      primaryColor: appPrimaryColor ?? primaryColor,
      secondaryColor: appSecondaryColor ?? secondaryColor,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
      covariant ThemeExtension<AppTheme>? other, double t) {
    if (other == null || other is! AppTheme) {
      return this;
    }
    return AppTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
    );
  }
}
