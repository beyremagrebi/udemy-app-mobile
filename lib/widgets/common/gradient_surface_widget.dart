import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradientSurfaceWidget extends StatelessWidget {
  final Widget? child;
  final bool forDrawer;

  const GradientSurfaceWidget({super.key, this.child, this.forDrawer = false});

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
            if (forDrawer == true) ...[
              const Color(0xFF1E1B4B),
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
