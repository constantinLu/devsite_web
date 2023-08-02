import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navbar.desktop.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => NavbarDesktop(),
      tablet: (_) => NavbarDesktop(),
      desktop: (_) => NavbarDesktop(),
    );
  }
}

