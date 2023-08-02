import 'package:devsite_web/presentation/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEVsite',
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      //TODO: ADD DYNAMIC ROUTES TO ADD CUSTOM ERROR PAGE WHEN NOT WORKING
      home: MainView(),
    );
  }

  ThemeData theme(BuildContext context) {
    return Theme.of(context).copyWith(
      primaryColor: kcBackgroundColor,
      focusColor: kcPrimaryColor,
      // Use openSansTextTheme !!!!!!!!! TODO:
      textTheme: GoogleFonts.openSansTextTheme().apply(
        bodyColor: Colors.white,
      ),
      colorScheme: const ColorScheme(
          background: Colors.black,
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.black,
          secondary: Colors.black,
          onSecondary: Colors.black,
          error: Colors.black,
          onError: Colors.black,
          onBackground: Colors.black,
          surface: Colors.black,
          onSurface: Colors.black),
    );
  }
}
