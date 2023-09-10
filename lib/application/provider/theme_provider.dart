import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/widget/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = processTheme();

  bool get isDarkMode => _isDarkMode;

  ThemeData getTheme() {
    return isDarkMode ? ThemeColors.darkTheme : ThemeColors.lightTheme;
  }

  Color getOppositeColor() {
    return isDarkMode ? ThemeColors.lightTheme.primaryColorLight : ThemeColors.darkTheme.primaryColorDark;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  static bool processTheme() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;

    if (hour > 6 && hour < 20) {
      return false;
    } else {
      return true;
    }
  }
}
