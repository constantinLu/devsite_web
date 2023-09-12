import 'package:devsite_web/presentation/view/services/service_view.desktop.dart';
import 'package:devsite_web/presentation/view/services/service_view.mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({Key? key}) : super(key: key);

  static const servicesMap = {
    "CUSTOM SOFTWARE": "Looking for a backend team to implement your business idea?"
        " Contact us for a bespoke back-end infrastructure. Upgrade, enhance, "
        "or migrate your back-ends at speed and affordable costs.",
    "API DEVELOPMENT AND INTEGRATION": "We can build a custom API to amplify your existing software "
        "or connect it with third-party services. Integrate your interface with other apps, devices, "
        "and business systems seamlessly and hassle-free.",
    "BACKEND REFACTORING": "Failing to get optimum app performance? Devsite Software "
        "can rehaul the entire solution infrastructure leaving the front end intact. Rebuild existing "
        "systems to reduce technical costs and enhance the code.",
    "MOBILE APP BACKEND DEVELOPMENT": "Devsite assists businesses in "
        "building robust mobile back-end apps across multiple devices and platforms. We create "
        "fault-tolerant back ends for native and cross-platform applications using the latest "
        "technology trends.",
    "WEB APPLICATIONS": "Leverage our backend web development services to ensure smooth and high "
        "website performance. Whether it’s a large-scale system, web portal, or IoT infrastructures, "
        "our team of web developers will deliver high-load performance systems with enhanced stability."
  };

  String getValue(searchKey) => servicesMap.keys.firstWhere((key) => servicesMap[key] == searchKey);

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
