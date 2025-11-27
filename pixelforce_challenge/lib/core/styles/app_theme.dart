import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true, 
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.blueDark,
    fontFamily: 'Inter', 
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.blueDark,
    ),
  );
}
