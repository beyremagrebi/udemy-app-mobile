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
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: Colors.white, // collapsed icon
        collapsedIconColor: Colors.white, // collapsed state
        textColor: Colors.white, // expanded text
        collapsedTextColor: Colors.white, // collapsed text
        shape: RoundedRectangleBorder(),
        collapsedShape: RoundedRectangleBorder(),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.white,
        selectionColor: Colors.white24, // highlight color
        selectionHandleColor: Colors.white,
      ),
      datePickerTheme: const DatePickerThemeData(),
      bottomNavigationBarTheme:
          AppBottomNavigationBarTheme.bottomNavigationBarTheme,
      iconTheme: const IconThemeData(color: Colors.white));
}
