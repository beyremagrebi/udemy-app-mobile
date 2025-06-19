import 'package:erudaxis/core/themes/app_bar_themes.dart';
import 'package:erudaxis/core/themes/app_color_schema.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import 'app_bottom_navigation_bar_theme.dart';
import 'app_card_theme.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
        primaryColor: AppColors.primaryColor,
        cardTheme: AppCardTheme.cardTheme,
        textTheme: AppTextTheme.textTheme,
        colorScheme: AppColorScheme.colorScheme,
        appBarTheme: AppBarThemes.appBarTheme,
        bottomNavigationBarTheme:
            AppBottomNavigationBarTheme.bottomNavigationBarTheme,
      );
}
