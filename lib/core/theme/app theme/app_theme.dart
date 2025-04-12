import 'package:evently/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeInit {
  static ThemeData dark = ThemeData(
    colorScheme: ColorScheme.dark(surface: AppColors.darkBlue),
  );

  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.dark(surface: AppColors.white),
  );
}
