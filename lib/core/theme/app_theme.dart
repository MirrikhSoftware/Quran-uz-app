import 'package:flutter/material.dart';
import 'package:quran/core/core.dart';

class AppTheme {
  ThemeData get light => ThemeData(
        // canvasColor: AppColors.background,
        primaryColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.primary),
        buttonTheme: const ButtonThemeData(buttonColor: AppColors.primary),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
        ),
        scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          crossAxisMargin: 6.w,
          radius: Radius.circular(3.r),
        ),
      );
}
