import 'package:devsite_web/application/provider/scroll_provider.dart';
import 'package:devsite_web/presentation/view/main_view.dart';
import 'package:devsite_web/presentation/widget/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../app_setup.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    var theme = AppThemeUtil(context).theme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
      ],
      child: Sizer(builder: (context, orentation, deviceType) {
        return MaterialApp(
          title: 'DEV - Coding the Future, NOW!',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData(true, context),
          home: MainView(),
        );
      }),
    );
  }
}
