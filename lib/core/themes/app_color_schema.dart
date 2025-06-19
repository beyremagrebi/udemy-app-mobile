import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class AppColorScheme {
  static ColorScheme get colorScheme => const ColorScheme(
        brightness: Brightness.dark, // Or Brightness.light if preferred
        primary: AppColors.primaryColor,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.onSecondary,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        error: AppColors.error,
        onError: AppColors.onError,
      );
}
