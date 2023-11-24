class PreferredLanguageMapping {
  final int languageId;
  final String languageName;
  final String languageCode;
  final String countryCode;

  const PreferredLanguageMapping(
      {required this.languageId, required this.languageName, required this.languageCode, required this.countryCode});
}

final List<PreferredLanguageMapping> preferredLanguageList = [
  const PreferredLanguageMapping(languageId: 1, languageName: "English", languageCode: "en", countryCode: "US"),
  const PreferredLanguageMapping(languageId: 2, languageName: "Español", languageCode: "es", countryCode: "ES"),
  // PreferredLanguageMapping(languageId: 3, languageName: "Cantonese"),
  // PreferredLanguageMapping(languageId: 4, languageName: "Tagalog"),
  // PreferredLanguageMapping(languageId: 5, languageName: "Vietnamese"),
  // PreferredLanguageMapping(languageId: 6, languageName: "Arabic"),
  // PreferredLanguageMapping(languageId: 7, languageName: "French"),
  // PreferredLanguageMapping(languageId: 8, languageName: "Korean"),
  // PreferredLanguageMapping(languageId: 9, languageName: "Russian"),
  // PreferredLanguageMapping(languageId: 10, languageName: "German"),
  // PreferredLanguageMapping(languageId: 11, languageName: "Haitian Creole"),
  // PreferredLanguageMapping(languageId: 12, languageName: "Hindi"),
  // PreferredLanguageMapping(languageId: 13, languageName: "Portuguese"),
  // PreferredLanguageMapping(languageId: 14, languageName: "Italian"),
  // PreferredLanguageMapping(languageId: 15, languageName: "Polish"),
];
