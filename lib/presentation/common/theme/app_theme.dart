import 'package:default_project/presentation/common/constants.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
        primaryColor: AppColors.primaryGray,
        accentColor: AppColors.accent,
      );
}
