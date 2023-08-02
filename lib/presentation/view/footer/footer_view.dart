import 'package:flutter/material.dart';

import '../../common/app_constants.dart';

class FooterView extends StatelessWidget {
  const FooterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      color: Colors.blue,
      width: kdDesktopMaxContentWidth,
      height: kdDesktopMaxContentHeight - 400,
      child: Center(
        child: Text(
          "FOOTER SECTION DATA\n LIKE: company logo on the left\n copyright, company address, maybe\n "
          "Links to Social Media, Instagram, Linkedin, github, medium, whatsup, telegram ",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
