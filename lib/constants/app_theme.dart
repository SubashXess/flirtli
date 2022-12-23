import 'package:flirtli/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: chatColor),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: GoogleFonts.roboto().fontFamily,
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    iconTheme: const IconThemeData(color: secondaryColor),
    textTheme: const TextTheme(headline6: TextStyle()),
    dialogBackgroundColor: Colors.white,
    unselectedWidgetColor: Colors.black,
    cardColor: Colors.white,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: scaffoldSecondaryDark,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: appButtonColorDark),
    scaffoldBackgroundColor: scaffoldColorDark,
    fontFamily: GoogleFonts.roboto().fontFamily,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: scaffoldSecondaryDark),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(headline6: TextStyle(color: textSecondaryColor)),
    dialogBackgroundColor: scaffoldSecondaryDark,
    unselectedWidgetColor: Colors.white60,
    cardColor: scaffoldSecondaryDark,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
