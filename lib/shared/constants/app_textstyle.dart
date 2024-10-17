import 'package:flutter/widgets.dart';

import 'app_colors.dart';

class AppTextstyle {
  static headingTextStyle(
          {FontWeight fontWeight = FontWeight.normal,
          double fontSize = 14,
          Color color = AppColors.black,
          TextOverflow overflow = TextOverflow.ellipsis}) =>
      _normalText(
        fontFamily: 'Sora',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: overflow,
      );
  static bodyTextStyle(
          {FontWeight fontWeight = FontWeight.normal,
          double fontSize = 14,
          Color color = AppColors.black,
          TextOverflow overflow = TextOverflow.ellipsis}) =>
      _normalText(
        fontFamily: 'WorkSans',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: overflow,
      );
  static roboto(
          {FontWeight fontWeight = FontWeight.normal,
          double fontSize = 14,
          Color color = AppColors.black,
          TextOverflow overflow = TextOverflow.ellipsis}) =>
      _normalText(
        fontFamily: 'roboto',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: overflow,
      );

  static TextStyle _normalText(
          {required String fontFamily,
          FontWeight fontWeight = FontWeight.normal,
          double fontSize = 14,
          Color color = AppColors.black,
          TextOverflow? overflow}) =>
      TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
          overflow: overflow,
          color: color);
}
