import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'navbar.desktop.dart';
import 'navbar.mobile.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => NavbarDesktop(),
      tablet: (_) => NavbarDesktop(),
      mobile: (_) => NavbarMobile(),
    );
  }
}
