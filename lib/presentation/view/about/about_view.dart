import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about_view.desktop.dart';
import 'about_view.mobile.dart';
import 'about_view.tablet.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(

      desktop: (_) => const AboutDesktopView(),
      tablet: (_) => const AboutTabletView(),
      mobile: (_) => AboutMobileView(),
    );
  }
}
