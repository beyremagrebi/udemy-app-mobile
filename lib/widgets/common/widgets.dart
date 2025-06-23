import 'dart:ui';

import 'package:erudaxis/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/themes/app_gradient.dart';

Widget gradientAppBarWidget(Widget? child) {
  return Container(
    width: double.maxFinite,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
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

Widget? gradientSurfaceWidget(Widget? child) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: const BoxDecoration(
      gradient: AppGradients.surfaceGradient,
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10,
        tileMode: TileMode.decal,
      ),
      child: child,
    ),
  );
}
