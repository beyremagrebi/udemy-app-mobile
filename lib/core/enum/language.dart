enum Language {
  french('Français', 'fr'),
  arabic('العربية', 'ar'),
  english('English', 'en');

  final String displayName;
  final String langaugeCode;
  const Language(this.displayName, this.langaugeCode);
}
