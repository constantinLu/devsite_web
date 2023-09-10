// screen sizes

import 'package:flutter/material.dart';

class DeviceSize {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width <= 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024 && MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1024;

  static double deviceHeight(
      BuildContext context, double desktopH, double tabletH, double mobileH) {
    var height = desktopH;
    if (DeviceSize.isDesktop(context)) {
      height = desktopH;
    }
    if (DeviceSize.isTablet(context)) {
      height = tabletH;
    }
    if (DeviceSize.isMobile(context)) {
      height = mobileH;
    }
    return height;
  }

  static double deviceWidth(BuildContext context, double desktopW, double tabletW, double mobileW) {
    var width = desktopW;
    if (DeviceSize.isDesktop(context)) {
      width = desktopW;
    }
    if (DeviceSize.isTablet(context)) {
      width = tabletW;
    }
    if (DeviceSize.isMobile(context)) {
      width = mobileW;
    }
    return width;
  }
}
