import 'package:flutter/material.dart';
import 'package:quran/core/constants/app_colors.dart';

class AppTheme {
  ThemeData get light => ThemeData(
        canvasColor: AppColors.background,
        primaryColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.primary),
        buttonTheme: const ButtonThemeData(buttonColor: AppColors.primary),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
        ),
      );
}
