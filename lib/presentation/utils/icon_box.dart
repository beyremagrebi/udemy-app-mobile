import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconBox extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final double size;
  final double borderRadius;
  final Alignment alignment;

  const IconBox({
    required this.icon,
    this.iconBackgroundColor = Colors.transparent,
    super.key,
    this.size = 38,
    this.borderRadius = 8,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ThemeViewModel>();
    return Container(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: iconBackgroundColor == Colors.transparent
              ? Border.all(color: Colors.white, strokeAlign: 0.1, width: 0.4)
              : null,
          gradient: LinearGradient(colors: [
            if (iconBackgroundColor == Colors.transparent) ...[
              viewModel.currentTheme.primary.withOpacity(0.2),
              viewModel.currentTheme.secondary.withOpacity(0.2),
            ] else ...[
              iconBackgroundColor,
              iconBackgroundColor.withOpacity(0.7)
            ]
          ]),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: size * 0.55,
        ),
      ),
    );
  }
}
