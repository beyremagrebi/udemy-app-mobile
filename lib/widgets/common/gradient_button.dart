import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/styles/app_colors.dart';
import 'package:erudaxis/core/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/enum/theme_app.dart';
import '../../providers/main/profile/theme/theme_view_model.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final bool isDisabled;

  const GradientButton({
    required this.text,
    super.key,
    this.onPressed,
    this.isDisabled = false,
    this.width = double.maxFinite,
    this.height = 35,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ThemeViewModel>();
    return Opacity(
      opacity: isDisabled ? 0.4 : 1,
      child: Container(
        width: width,
        height: height,
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
          borderRadius: Dimensions.xsmallBorderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isDisabled ? null : onPressed,
            borderRadius: Dimensions.smallBorderRadius,
            child: Center(
              child: Text(
                text,
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
