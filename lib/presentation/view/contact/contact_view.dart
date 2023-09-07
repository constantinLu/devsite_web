import 'package:devsite_web/presentation/view/contact/contact_view.desktop.dart';
import 'package:devsite_web/presentation/view/contact/contact_view.mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => ContactDesktopView(),
      tablet: (_) => ContactDesktopView(),
      mobile: (_) => ContactMobileView(),
    );
  }
}
