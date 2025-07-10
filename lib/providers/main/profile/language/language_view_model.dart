import 'package:erudaxis/core/enum/language.dart';
import 'package:erudaxis/presentation/utils/preferences/language_preference.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

class LanguageViewModel extends BaseViewModel {
  Locale locale = const Locale('fr');
  Language currentLanguage = Language.french;
  LanguageViewModel(super.context);
  Future<void> changleLanguage(Language selectedLanguage) async {
    await LanguagePreference.shared.save(selectedLanguage);
    locale = Locale(selectedLanguage.langaugeCode);
    currentLanguage = selectedLanguage;
    update();
  }

  Future<void> loadLanguage() async {
    currentLanguage = await LanguagePreference.shared.load() ?? Language.french;
    locale = Locale(currentLanguage.langaugeCode);
    update();
  }
}
