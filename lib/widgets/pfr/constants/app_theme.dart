import 'package:app/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  //text theme for light theme
  static const TextStyle _lightHeadingTextStyle =
      TextStyle(fontFamily: 'NotoSansCJKKR', fontSize: 20, height: 1.4, fontWeight: FontWeight.w500, color: AppColors.lightMainText);
  static const TextStyle _lightBodyTextStyle =
      TextStyle(fontSize: 16.0, fontFamily: "NotoSansCJKkr", color: AppColors.lightMainText, fontWeight: FontWeight.normal);
  static const TextStyle _lightContentTextStyle =
      TextStyle(fontSize: 14.0, color: AppColors.lightMainText, fontFamily: "NotoSansCJKKR", fontWeight: FontWeight.w400);
  static const TextStyle _lightSubtitleTextStyle =
      TextStyle(fontSize: 16.0, color: AppColors.lightMainText, fontFamily: "NotoSansCJKKR", fontWeight: FontWeight.w500);
  static const TextStyle _lightCaptionTextStyle =
      TextStyle(fontSize: 12.0, color: AppColors.black, fontFamily: "NotoSansCJKKR", fontWeight: FontWeight.w300);
  static const TextStyle _lightOnButtonTextStyle =
      TextStyle(fontSize: 16.0, color: AppColors.white, fontFamily: "NotoSansCJKKR", fontWeight: FontWeight.w500);

  static const TextTheme _lightTextTheme = TextTheme(
      headline1: _lightHeadingTextStyle,
      headline2: _lightHeadingTextStyle,
      headline3: _lightHeadingTextStyle,
      headline4: _lightHeadingTextStyle,
      headline5: _lightHeadingTextStyle,
      headline6: _lightHeadingTextStyle,
      bodyText1: _lightBodyTextStyle,
      bodyText2: _lightContentTextStyle,
      button: _lightContentTextStyle,
      subtitle1: _lightSubtitleTextStyle,
      subtitle2: _lightContentTextStyle,
      caption: _lightCaptionTextStyle,
      overline: _lightCaptionTextStyle);

  ///text theme for dark theme
  // static final TextStyle _darkHeadingTextStyle =
  //     _lightHeadingTextStyle.copyWith(color: AppColors.white);
  // static final TextStyle _darkBodyTextStyle =
  //     _lightBodyNameTextStyle.copyWith(color: AppColors.white);
  // static final TextStyle _darkContentTextStyle =
  //     _lightContentTextStyle.copyWith(color: AppColors.white);
  // static const TextStyle _darkButtonTextStyle = TextStyle(
  //     fontSize: 14.0, color: AppColors.white, fontWeight: FontWeight.w500);
  // static const TextStyle _darkScreenCaptionTextStyle = TextStyle(
  //     fontSize: 13.0, color: AppColors.white, fontWeight: FontWeight.w400);

  // static final TextTheme _darkTextTheme = TextTheme(
  //     headline1: _darkHeadingTextStyle,
  //     bodyText1: _darkBodyTextStyle,
  //
  //     ///Main Text
  //     bodyText2: _darkContentTextStyle,
  //     button: _darkButtonTextStyle,
  //     subtitle1: _darkContentTextStyle,
  //     subtitle2: _darkContentTextStyle,
  //     caption: _darkScreenCaptionTextStyle,
  //     headline6: _darkHeadingTextStyle,
  //     overline: _darkHeadingTextStyle);

  static const CupertinoTextThemeData _lightCupertinoTextThemeData =
      CupertinoTextThemeData(primaryColor: AppColors.lightOnPrimary, textStyle: _lightContentTextStyle, navTitleTextStyle: _lightHeadingTextStyle);

  static final CupertinoTextThemeData _darkCupertinoTextThemeData = CupertinoTextThemeData(primaryColor: AppColors.white);

  ///Set Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightBackground,
    ),
    appBarTheme: const AppBarTheme(
      // color: AppColors.blueTheme,
      elevation: 1,
      backgroundColor: AppColors.lightBackground,
      actionsIconTheme: IconThemeData(color: AppColors.black, size: 25),
      iconTheme: IconThemeData(color: AppColors.black),
      // ignore: deprecated_member_use
      textTheme: _lightTextTheme,
      titleTextStyle: _lightHeadingTextStyle,
    ),
    cardTheme: CardTheme(
      color: AppColors.lightPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      shadowColor: AppColors.lightOnPrimary,
    ),

    cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.lightPrimary,
        textTheme: _lightCupertinoTextThemeData,
        barBackgroundColor: AppColors.lightBackground,
        scaffoldBackgroundColor: AppColors.lightSurface,
        primaryContrastingColor: AppColors.lightPrimary),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.lightPrimary,
      onPrimary: AppColors.lightOnPrimary,

      primaryVariant: AppColors.lightPrimaryVariant,
      secondary: AppColors.lightSecondary,
      onSecondary: AppColors.lightOnSecondary,
      secondaryVariant: AppColors.lightSecondaryVariant,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightOnSurface,
      background: AppColors.lightBackground,
      onBackground: AppColors.lightOnBackground,
      error: AppColors.error,
      onError: AppColors.white,
    ),
    // snackBarTheme: const SnackBarThemeData(backgroundColor: AppColors.lightSecondary,contentTextStyle: _lightScreenTaskDurationTextStyle),
    iconTheme: const IconThemeData(
      color: AppColors.lightPrimaryVariant,
    ),
    popupMenuTheme: PopupMenuThemeData(
        color: AppColors.lightPrimary,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        textStyle: _lightContentTextStyle),
    textTheme: _lightTextTheme,

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(_lightOnButtonTextStyle),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.lightPrimary,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      splashColor: AppColors.lightOnSecondary,
    ),
    backgroundColor: AppColors.lightBackground,
    fontFamily: "NotoSansCJKkr",
    unselectedWidgetColor: AppColors.lightSecondaryVariant,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.lightPrimaryVariant,
    ),
    // inputDecorationTheme:  InputDecorationTheme(
    //   contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    //
    //   fillColor: AppColors.white,
    //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //       color: AppColors.lightPrimaryVariant,
    //     ),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(
    //       color: AppColors.lightOnPrimary,
    //     ),
    //   ),
    //   labelStyle: TextStyle(
    //     color: AppColors.lightSecondaryVariant,
    //   ),
    // ),
  );

// DarkTheme
// static final ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   scaffoldBackgroundColor: AppColors.darkBackground,
//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     backgroundColor: AppColors.darkPrimaryVariant,
//   ),
//   appBarTheme: AppBarTheme(
//       brightness: Brightness.dark,
//       color: AppColors.darkOnPrimary,
//       elevation: 1,
//       iconTheme: const IconThemeData(color: AppColors.darkPrimaryVariant),
//       textTheme: _darkTextTheme,
//       shadowColor: AppColors.darkOnSurface,
//       titleTextStyle: TextStyle(
//           color: AppColors.darkOnSurface,
//           fontSize: 16,
//           fontWeight: FontWeight.normal)),
//   cardTheme: CardTheme(
//     color: AppColors.darkSecondary,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     elevation: 0,
//     shadowColor: AppColors.darkOnSurface,
//   ),
//   cupertinoOverrideTheme: CupertinoThemeData(
//       brightness: Brightness.dark,
//       primaryColor: AppColors.darkPrimary,
//       textTheme: _darkCupertinoTextThemeData,
//       barBackgroundColor: AppColors.darkBackground,
//       scaffoldBackgroundColor: AppColors.darkSurface,
//       primaryContrastingColor: AppColors.darkPrimary),
//   colorScheme: ColorScheme.light(
//       primary: AppColors.darkPrimary,
//       primaryVariant: AppColors.darkPrimaryVariant,
//       secondary: AppColors.darkSecondary,
//       secondaryVariant: AppColors.darkSecondaryVariant,
//       onPrimary: AppColors.darkOnPrimary,
//       onSecondary: AppColors.darkOnSecondary,
//       background: AppColors.darkBackground,
//       surface: AppColors.darkSurface,
//       onSurface: AppColors.darkOnSurface,
//       brightness: Brightness.dark,
//       onBackground: AppColors.darkOnBackground,
//       error: AppColors.red,
//       onError: AppColors.black),
//   // snackBarTheme:
//   //     const SnackBarThemeData(backgroundColor: AppColors.darkOnPrimary),
//   iconTheme: const IconThemeData(
//     color: AppColors.darkPrimaryVariant,
//   ),
//   popupMenuTheme: const PopupMenuThemeData(
//     color: AppColors.darkSecondary,
//   ),
//   textTheme: _darkTextTheme,
//   buttonTheme: const ButtonThemeData(
//       buttonColor: AppColors.darkPrimary, textTheme: ButtonTextTheme.primary),
//   unselectedWidgetColor: AppColors.darkSurface,
//   textSelectionTheme: const TextSelectionThemeData(
//     cursorColor: AppColors.darkSecondary,
//   ),
//   inputDecorationTheme: const InputDecorationTheme(
//     fillColor: AppColors.darkSecondary,
//     labelStyle: TextStyle(
//       color: AppColors.darkOnSecondary,
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: AppColors.darkSecondaryVariant,
//       ),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: AppColors.darkSecondaryVariant,
//       ),
//     ),
//   ),
// );

}
