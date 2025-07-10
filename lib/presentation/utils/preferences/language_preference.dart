import 'package:erudaxis/core/constants/constant.dart';
import 'package:erudaxis/core/enum/language.dart';
import 'package:erudaxis/presentation/utils/preferences/base_preferences.dart';
import 'package:flutter/widgets.dart';

class LanguagePreference extends BasePreferences<Language> {
  static final LanguagePreference _instance = LanguagePreference._internal();

  static LanguagePreference get shared => _instance;

  LanguagePreference._internal();
  @override
  String get key => sharedLanguageKey;

  @override
  Future<Language?> load() async {
    try {
      await init();
      final value = prefs.getString(key);

      if (value == null) {
        return null;
      }
      return Language.values.firstWhere(
        (language) => language.langaugeCode == value,
        orElse: () => Language.french,
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> save(Language value) async {
    try {
      await init();
      await prefs.setString(key, value.langaugeCode);

      debugPrint('$key SAVED INTO SHARED');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
