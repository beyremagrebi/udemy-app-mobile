import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:erudaxis/providers/main/profile/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typing_indicator/flutter_typing_indicator.dart';
import 'package:provider/provider.dart';

class TypingIndecatorWidget extends StatelessWidget {
  final Color background;
  final double padding;
  const TypingIndecatorWidget(
      {super.key, this.background = Colors.transparent, this.padding = 0});

  @override
  Widget build(BuildContext context) {
    final themViewModel = context.watch<ThemeViewModel>();
    return TypingIndicator(
      padding: padding,
      backgroundColor: background,
      isGradient: true,
      dotGradient: LinearGradient(colors: [
        if (themViewModel.currentTheme == ThemeApp.defaultTheme) ...[
          const Color.fromARGB(255, 195, 142, 248),
          Colors.white70,
        ] else if (themViewModel.currentTheme == ThemeApp.charcoal) ...[
          Colors.white70,
          Colors.white70,
        ] else ...[
          themViewModel.currentTheme.primary,
          themViewModel.currentTheme.secondary,
        ]
      ]),
    );
  }
}
