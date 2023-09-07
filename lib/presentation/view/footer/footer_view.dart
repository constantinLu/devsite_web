import 'package:devsite_web/presentation/view/footer/footer_view.desktop.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterView extends StatefulWidget {
  const FooterView({
    super.key,
  });

  @override
  State<FooterView> createState() => _FooterViewState();
}

class _FooterViewState extends State<FooterView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => const FooterDesktopView(),
      tablet: (_) => const FooterDesktopView(),
      mobile: (_) => const FooterDesktopView(),
    );
  }
}
