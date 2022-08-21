import 'package:flutter/material.dart';
import 'package:quran/core/constants/app_colors.dart';

class AppTheme {
  ThemeData get light => ThemeData(
        canvasColor: AppColors.background,
        primaryColor: AppColors.primary,
        buttonTheme: ButtonThemeData(),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          
        )
      );
}
