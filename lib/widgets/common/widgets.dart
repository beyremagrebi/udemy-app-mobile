import 'package:erudaxis/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/themes/app_gradient.dart';

Widget? gradientSurfaceWidget(Widget? child) {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppGradients.surfaceGradient,
        ),
      ),
      if (child != null) child,
    ],
  );
}

Widget gradientAppBarWidget(Widget? child) {
  return Container(
    width: double.maxFinite,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColors.surfaceGradientEnd,
          Color.fromARGB(255, 41, 72, 248),
          Color.fromARGB(255, 41, 72, 248),
        ],
      ),
    ),
    child: child,
  );
}
