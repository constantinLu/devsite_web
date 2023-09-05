import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/app_constants.dart';

class FooterMobileView extends StatelessWidget {
  const FooterMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 1.h, 0, 2.h),
      height: height * 0.07,
      width: width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      openURL(github);
                    },
                    icon: const Icon(FontAwesomeIcons.github)),
                IconButton(
                    onPressed: () {
                      openURL(linkedIn);
                    },
                    icon: const Icon(FontAwesomeIcons.linkedinIn)),
              ],
            ),
            const Text("Copyright © 2023 Devsite LLC . All Rights Reserved"),
          ],
        ),
      ),
    );
  }
}

// URL Launcher
void openURL(String url) => launchUrl(Uri.parse(url));
