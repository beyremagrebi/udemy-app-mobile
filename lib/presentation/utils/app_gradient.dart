import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:erudaxis/core/styles/app_colors.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static LinearGradient buttonGradient(ThemeViewModel viewModel) {
    return LinearGradient(
      colors: [
        if (viewModel.currentTheme == ThemeApp.defaultTheme) ...[
          AppColors.surfaceGradientEnd,
          const Color.fromARGB(255, 41, 72, 248),
          const Color.fromARGB(255, 41, 72, 248),
        ] else ...[
          viewModel.currentTheme.primary,
          viewModel.currentTheme.secondary,
        ]
      ],
    );
  }

  static LinearGradient loginLogoGradient(ThemeViewModel viewModel) {
    return LinearGradient(colors: [
      viewModel.currentTheme.secondary,
      Colors.white,
      Colors.white,
      Colors.white,
    ]);
  }
}
