import 'package:erudaxis/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient surfaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.surfaceGradientStart,
      AppColors.surfaceGradientEnd,
    ],
  );
}
