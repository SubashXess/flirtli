import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart' as nb;
import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../main.dart';
import '../utilities/app_localizations.dart';

abstract class AppStoreBase with Store {
  @observable
  bool isLoggedIn = false;

  @observable
  bool isDarkMode = false;

  @observable
  bool isLoading = false;

  @observable
  String selectedLanguageCode = defaultLanguage;

  @observable
  AppBarTheme appBarTheme = const AppBarTheme();

  @action
  Future<void> setLoggedIn(bool val) async {
    isLoggedIn = val;
    nb.setValue(IS_LOGGED_IN, val);
  }

  @action
  Future<void> setLoading(bool aVal) async {
    isLoading = aVal;
  }

  @action
  Future<void> setDarkMode(bool aIsDarkMode) async {
    isDarkMode = aIsDarkMode;

    if (isDarkMode) {
      nb.textPrimaryColorGlobal = Colors.white;
      nb.textSecondaryColorGlobal = textSecondaryColor;

      nb.defaultLoaderBgColorGlobal = scaffoldSecondaryDark;
      nb.appButtonBackgroundColorGlobal = appButtonColorDark;
      nb.appBarBackgroundColorGlobal = scaffoldSecondaryDark;
      nb.shadowColorGlobal = Colors.white12;
      nb.setStatusBarColor(scaffoldSecondaryDark,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light);
    } else {
      nb.textPrimaryColorGlobal = textPrimaryColor;
      nb.textSecondaryColorGlobal = textSecondaryColor;

      nb.defaultLoaderBgColorGlobal = Colors.white;
      nb.appButtonBackgroundColorGlobal = Colors.white;
      nb.appBarBackgroundColorGlobal = primaryColor;
      nb.shadowColorGlobal = Colors.black12;
      nb.setStatusBarColor(primaryColor,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light);
    }
  }

  @action
  Future<void> setLanguage(String aSelectedLanguageCode, {context}) async {
    selectedLanguageCode = aSelectedLanguageCode;

    language = languages
        .firstWhere((element) => element.languageCode == aSelectedLanguageCode);
    await nb.setValue(LANGUAGE, aSelectedLanguageCode);

    if (context != null) {
      appLocalizations = AppLocalizations.of(context);
      nb.errorThisFieldRequired = appLocalizations!.translate('field_Required');
    }
  }
}
