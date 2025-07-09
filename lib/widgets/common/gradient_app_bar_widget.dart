import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/styles/app_colors.dart';
import '../../providers/main/profile/theme/theme_view_model.dart';

class GradientAppBarWidget extends StatelessWidget {
  final Widget? child;
  const GradientAppBarWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ThemeViewModel>();
    return Container(
      margin: EdgeInsets.zero,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
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
        ),
      ),
      child: child,
    );
  }
}
