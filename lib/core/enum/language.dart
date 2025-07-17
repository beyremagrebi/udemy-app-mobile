import 'package:erudaxis/core/constants/constant.dart';

enum Language {
  french('Français', 'fr'),
  arabic('العربية', 'ar'),
  english('English', 'en');

  final String displayName;
  final String langaugeCode;
  const Language(this.displayName, this.langaugeCode);

  String getLocalizedName() {
    switch (this) {
      case Language.french:
        return intl.languageFrench;
      case Language.arabic:
        return intl.languageArabic;
      case Language.english:
        return intl.languageEnglish;
    }
  }
}
