import 'package:devsite_web/application/provider/scroll_provider.dart';
import 'package:devsite_web/application/provider/theme_provider.dart';
import 'package:devsite_web/presentation/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../app_setup.dart';
import 'common/messages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Sizer(builder: (context, orentation, deviceType) {
        return MaterialApp(
          title: appTitle,
          debugShowCheckedModeBanner: false,
          theme: Provider.of<ThemeProvider>(context).getTheme(),
          home: MainView(),
        );
      }),
    ).animate().fadeIn(duration: 400.ms);
  }
}
