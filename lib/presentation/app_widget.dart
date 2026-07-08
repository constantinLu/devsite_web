import 'package:devsite_web/application/provider/scroll_provider.dart';
import 'package:devsite_web/presentation/common/app_routes.dart';
import 'package:devsite_web/application/provider/theme_provider.dart';
import 'package:devsite_web/presentation/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:seo/seo.dart';
import 'package:sizer/sizer.dart';

import '../app_setup.dart';
import 'common/messages.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    // Mirrors the canvas-rendered widget tree into a semantic HTML tree so
    // crawlers (Googlebot) can read the page content. See Seo.* widgets below.
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ScrollProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: Sizer(builder: (context, orentation, deviceType) {
          return MaterialApp(
            title: appTitle,
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeProvider>(context).getTheme(),
            initialRoute: AppRoutes.home,
            onGenerateRoute: (settings) {
              final sectionIndex = AppRoutes.sectionFor(settings.name ?? AppRoutes.home);
              return MaterialPageRoute(
                builder: (_) => MainView(initialSection: sectionIndex),
                settings: settings,
              );
            },
          );
        }),
      ).animate().fadeIn(duration: 200.ms),
    );
  }
}
