import 'dart:ui';

import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradientSurfaceWidget extends StatelessWidget {
  final Widget? child;

  const GradientSurfaceWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ThemeViewModel>();
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E1B4B),
            viewModel.currentTheme.primary,
            viewModel.currentTheme.secondary,
          ],
        ),
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
}
