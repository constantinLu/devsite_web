import 'package:devsite_web/presentation/view/navbar/navbar.mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

import 'navbar.desktop.dart';

class NavBar extends StatelessWidget implements PreferredSize {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => NavbarDesktop(),
      tablet: (_) => NavbarDesktop(),
      mobile: (_) => NavbarMobile(),
    );
  }

  @override
  // TODO: implement child
  Widget get child => SizedBox();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(12.h);
}
