import 'package:devsite_web/presentation/view/showcase/showcase_view.desktop.dart';
import 'package:devsite_web/presentation/view/showcase/showcase_view.mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ShowcaseView extends StatefulWidget {
  const ShowcaseView({super.key});

  @override
  State<ShowcaseView> createState() => _ShowcaseViewState();
}

class _ShowcaseViewState extends State<ShowcaseView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => const ShowcaseDesktopView(),
      tablet: (_) => const ShowcaseDesktopView(),
      mobile: (_) => const ShowcaseMobileView(),
    );
  }
}
