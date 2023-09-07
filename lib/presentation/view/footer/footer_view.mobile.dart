import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/app_constants.dart';

class FooterMobileView extends StatelessWidget {

  const FooterMobileView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      child: Center(child: Text("FOOTER MOBILE")),
    );
  }
}