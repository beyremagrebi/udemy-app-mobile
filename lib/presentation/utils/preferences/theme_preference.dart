import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/enum/theme_app.dart';
import 'package:erudaxis/presentation/utils/preferences/base_preferences.dart';
import 'package:flutter/widgets.dart';

class ThemePreference extends BasePreferences<ThemeApp> {
  static final ThemePreference _instance = ThemePreference._internal();

  static ThemePreference get shared => _instance;

  ThemePreference._internal();
  @override
  String get key => sharedThemeKey;

  @override
  Future<ThemeApp?> load() async {
    try {
      await init();
      final value = prefs.getString(key);

      if (value == null) {
        return null;
      }
      return ThemeApp.values.firstWhere(
        (theme) => theme.key == value,
        orElse: () => ThemeApp.defaultTheme,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> save(ThemeApp value) async {
    try {
      await init();
      await prefs.setString(key, value.key);

      debugPrint('$key SAVED INTO SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
