import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_view.desktop.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => const HomeViewDesktop(),
      mobile: (_) => const HomeViewDesktop(),
      tablet: (_) => const HomeViewDesktop(),
    );
  }
}
