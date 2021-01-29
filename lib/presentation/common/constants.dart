import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppMargins {
  static const mini = 2.0;
  static const verySmall = 4.0;
  static const small = 8.0;
  static const medium = 16.0;
  static const big = 24.0;
}

abstract class AppFontSizes {
  static const small = 12.0;
  static const normal = 14.0;
  static const big = 16.0;
}

abstract class AppColors {
  static const white = const Color(0xffffffff);

  static const lightGrey = const Color(0xffc8c8c8);

  static const grey = const Color(0xffa6b9cd);

  static const darkGrey = const Color(0xff444444);

  static const black = const Color(0xff000000);

  static Color getTextColorForBackground(Color backgroundColor) {
    return backgroundColor.computeLuminance() < 0.50 ? white : textDark;
  }

  //App colors for theme #1
  static const primaryGreen = const Color(0xff43A047);
  static const primaryDarkGreen = const Color(0xff2E7D32);
  static const primaryGray = const Color(0xff607D8B);
  static const primaryDarkGray = const Color(0xff455A64);
  static const accent = const Color(0xffFFA000);

  static const textDark = const Color(0xff2e2e2e);
  static const textGrayish = const Color(0xff505050);
  static const textDarkTitle = const Color(0xff464646);
  static const textPositive = const Color(0xff3b7e00);
}

abstract class AppTextStyle {
  static TextStyle robotoBold(
          {Color color,
          double size,
          double letterSpacing,
          double height = 1.0,
          TextDecoration decoration}) =>
      _textStyle(
          fontFamily: "Roboto",
          color: color,
          size: size,
          decoration: decoration,
          fontWeight: FontWeight.w700,
          letterSpacing: letterSpacing,
          height: height);

  static TextStyle robotoRegular(
          {Color color,
          double size,
          double letterSpacing,
          double height = 1.0,
          TextDecoration decoration}) =>
      _textStyle(
          fontFamily: "Roboto",
          color: color,
          size: size,
          decoration: decoration,
          fontWeight: FontWeight.w400,
          letterSpacing: letterSpacing,
          height: height);

  static TextStyle robotoMedium({
    Color color,
    double size,
    double height = 1.0,
    TextDecoration decoration,
    double letterSpacing,
  }) =>
      _textStyle(
          fontFamily: "Roboto",
          color: color,
          size: size,
          decoration: decoration,
          fontWeight: FontWeight.w600,
          letterSpacing: letterSpacing,
          height: height);

  static TextStyle _textStyle(
      {@required String fontFamily,
      Color color,
      double size,
      FontWeight fontWeight,
      TextDecoration decoration,
      double letterSpacing,
      double height = 1.0}) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: decoration ?? TextDecoration.none,
        letterSpacing: letterSpacing ?? 0,
        height: height);
  }
}
