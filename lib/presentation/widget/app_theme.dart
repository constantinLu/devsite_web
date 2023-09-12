import 'package:flutter/material.dart';

import '../common/color_picker.dart';
import '../common/gradient_picker.dart';

class AppTheme {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return isDarkTheme ? ThemeColors.darkTheme : ThemeColors.lightTheme;
  }

  static Color backgroundColor = ThemeColors.darkTheme.primaryColor;
}

class ThemeColors {
  const ThemeColors._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'TT-Commons',
    primaryColor: kcWhiteCultured,
    scaffoldBackgroundColor: kcWhitePure,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      backgroundColor: kcDarkGreyColor,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(color: kcBlackFull),
      bodyMedium: TextStyle(color: kcBlackFull),
    ),
  );

  /// DARK THEME
  /// CONFIGURED
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'TT-Commons',
    primaryColor: kcWhiteCultured,
    scaffoldBackgroundColor: kcDarkGreyColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      //DISPLAY
      displayLarge: TextStyle(color: kcWhiteCultured),
      displayMedium: TextStyle(color: kcWhiteCultured),
      displaySmall: TextStyle(color: kcWhiteCultured),
      //HEADLINE
      headlineLarge: TextStyle(color: kcWhiteCultured),
      headlineMedium: TextStyle(color: kcWhiteCultured),
      headlineSmall: TextStyle(color: kcWhiteCultured),
      //TITLE
      titleLarge: TextStyle(color: kcWhiteCultured),
      titleMedium: TextStyle(color: kcWhiteCultured),
      titleSmall: TextStyle(color: kcWhiteCultured),
      //LABEL
      labelLarge: TextStyle(color: kcWhiteCultured),
      labelMedium: TextStyle(color: kcWhiteCultured),
      labelSmall: TextStyle(color: kcWhiteCultured),
      //BODY
      bodyLarge: TextStyle(color: kcWhiteCultured),
      bodyMedium: TextStyle(color: kcWhiteCultured),
      bodySmall: TextStyle(color: kcWhiteCultured),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
    ),
  );
}
// static Brightness get currentSystemBrightness =>
//     View.of(context).devicePixelRatio;
//     SchedulerBinding.instance.window.platformBrightness;

extension ThemeExtras on ThemeData {
  Color get navBarColor => brightness == Brightness.light ? kcBlackCarbon : kcWhiteCultured;

  //
  Color get textColor => brightness == Brightness.light ? kcBlackCarbon : kcWhiteCultured;

  //
  Color get secondaryColor => Colors.cyanAccent;

  //
  Gradient get serviceCard => brightness == Brightness.light ? grayWhite : grayBack;

  //
  Gradient get contactCard => brightness == Brightness.light ? grayBack : pinkpurple;
}

class AppThemeUtil {
  static AppThemeUtil? _instance;

  final context;

  AppThemeUtil._(this.context);

  factory AppThemeUtil(context) => _instance ??= AppThemeUtil._(context);

  static void init(context) {
    AppThemeUtil(context);
  }

  get theme => Theme.of(context);
}
