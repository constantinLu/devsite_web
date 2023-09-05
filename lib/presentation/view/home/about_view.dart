import 'package:devsite_web/presentation/view/home/about_view.mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about_view.desktop.dart';

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
      tablet: (_) => const AboutDesktopView(),
      mobile: (_) => const AboutMobileView(),
    );
  }
}