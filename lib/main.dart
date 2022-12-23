import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flirtli/constants/app_colors.dart';
import 'package:flirtli/models/language.dart';
import 'package:flirtli/pages/homepage.dart';
import 'package:flirtli/utilities/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'constants/app_common.dart';
import 'constants/app_constants.dart';
import 'constants/app_theme.dart';
import 'models/file_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart' as loc;

late AppLocalizations? appLocalizations;
late Language? language;
List<Language> languages = Language.getLanguages();
late List<FileModel> fileList = [];

// MobX
// AppStore appStore = AppStore();

bool kIsEnterKey = false;
int kChatFontSize = 16;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Function? originalOnError = FlutterError.onError;
  FlutterError.onError = (FlutterErrorDetails details) async {
    await FirebaseCrashlytics.instance.recordFlutterError(details);
    originalOnError!(details);
  };
  await initialize();
  appSetting();

  appButtonBackgroundColorGlobal = primaryColor;
  defaultAppButtonTextColorGlobal = Colors.white;
  appBarBackgroundColorGlobal = primaryColor;
  defaultLoaderBgColorGlobal = chatColor;

  int themeModeIndex = getIntAsync(THEME_MODE_INDEX);
  if (themeModeIndex == ThemeModeLight) {
  } else if (themeModeIndex == ThemeModeDark) {}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: 'Flirtli',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        supportedLocales: Language.languagesLocale(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          loc.GlobalMaterialLocalizations.delegate,
          loc.GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) => locale,
        home: const HomePage(),
      ),
    );
  }
}
