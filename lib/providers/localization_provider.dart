import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porto_vacation_club/shared/app_persistance/app_local.dart';
import '../shared/constants/lang_constants.dart';
import '../domain/api_models/language_model.dart';

final localizationProvider =
    NotifierProvider<LocalizationProvider, Locale>(LocalizationProvider.new);

class LocalizationProvider extends Notifier<Locale> {
  int _languageIndex = 0;
  int get languageIndex => _languageIndex;
  @override
  Locale build() => _loadCurrentLanguage();

  Locale _loadCurrentLanguage() {
    _languageIndex = AppLocal.ins.appBox
        .get(LangConstants.languageIndex, defaultValue: _languageIndex);
    LanguageModel lang = LangConstants.languages.elementAt(_languageIndex);
    return Locale(lang.languageCode, lang.countryCode);
  }

  void setLanguage(int langIndex) {
    LanguageModel lang = LangConstants.languages.elementAt(langIndex);
    AppLocal.ins.appBox.put(LangConstants.languageIndex, langIndex);
    _languageIndex = langIndex;
    state = Locale(lang.languageCode, lang.countryCode);
  }
}
