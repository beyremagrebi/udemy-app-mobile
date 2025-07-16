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
      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.transparent,
        headerBackgroundColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        rangePickerHeaderForegroundColor: Colors.white,
        rangeSelectionBackgroundColor: Colors.white,
        inputDecorationTheme:
            const InputDecorationTheme(fillColor: Colors.white),
        rangePickerHeaderBackgroundColor: Colors.white,
        rangeSelectionOverlayColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? Colors.white.withOpacity(0.2) // subtle highlight
                : Colors.grey),
        rangePickerHeaderHeadlineStyle: const TextStyle(color: Colors.white),
        headerForegroundColor: Colors.white,
        weekdayStyle: const TextStyle(color: Colors.white),
        rangePickerSurfaceTintColor: Colors.white,
        // Days
        dayForegroundColor:
            WidgetStateColor.resolveWith((states) => Colors.white),
        dayBackgroundColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? Colors.transparent
                : Colors.transparent),
        dayOverlayColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? Colors.white.withOpacity(0.2) // subtle highlight
                : Colors.grey),

        // Years
        yearForegroundColor:
            WidgetStateColor.resolveWith((states) => Colors.white),
        yearBackgroundColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? Colors.transparent
                : Colors.transparent),
        yearOverlayColor: WidgetStateColor.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? Colors.white.withOpacity(0.2)
                : Colors.transparent),

        // Today
        todayForegroundColor:
            WidgetStateColor.resolveWith((states) => Colors.white),
        todayBackgroundColor:
            WidgetStateColor.resolveWith((states) => Colors.transparent),

        // Other elements
        dividerColor: Colors.white,

        shadowColor: Colors.transparent,
        elevation: 0,
        yearStyle: const TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme:
          AppBottomNavigationBarTheme.bottomNavigationBarTheme,
      iconTheme: const IconThemeData(color: Colors.white));
}
