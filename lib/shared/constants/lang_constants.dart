import '../../domain/api_models/language_model.dart';

class LangConstants {
  static const String languageIndex = 'LANGUAGE_INDEX';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    // LanguageModel(
    //     imageUrl: '',
    //     languageName: 'Trukish',
    //     countryCode: 'TR',
    //     languageCode: 'tr'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Arabic',
        countryCode: 'AR',
        languageCode: 'ar'),
  ];
}
