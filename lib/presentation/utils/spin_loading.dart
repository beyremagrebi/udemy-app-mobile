import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../providers/main/profile/theme/theme_view_model.dart';

class SpinLoading extends StatelessWidget {
  const SpinLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = context.watch<ThemeViewModel>();
    return SpinKitDualRing(
      color: themeViewModel.currentTheme == ThemeApp.charcoal
          ? Colors.white
          : themeViewModel.currentTheme.secondary,
      size: 35,
    );
  }
}
