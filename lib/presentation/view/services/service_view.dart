import 'package:devsite_web/presentation/view/services/service_view.desktop.dart';
import 'package:devsite_web/presentation/view/services/service_view.mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({Key? key}) : super(key: key);

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (_) => const ServiceDesktopView(),
      tablet: (_) => const ServiceDesktopView(),
      mobile: (_) => const ServiceMobileView(),
    );
  }
}
