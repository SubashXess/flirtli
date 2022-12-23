import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import '../models/language.dart';

class AppLocalizations {
  final Locale locale;

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationDelegate();

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings[key]
        .validate(value: 'Localization key is missing');
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language code here
    return Language.languages().contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return true;
  }
}
