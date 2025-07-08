import 'package:erudaxis/core/enum/language.dart';
import 'package:erudaxis/providers/base_view_model.dart';
import 'package:flutter/material.dart';

class LanguageViewModel extends BaseViewModel {
  Locale locale = const Locale('fr');
  Language currentLanguage = Language.french;
  LanguageViewModel(super.context);

  void changleLanguage(Language selectedLanguage) {
    locale = Locale(selectedLanguage.langaugeCode);
    currentLanguage = selectedLanguage;
    update();
  }
}
