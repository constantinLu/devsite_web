import 'package:flutter/material.dart';

import '../../common/app_constants.dart';

class ContactView extends StatelessWidget {
  const ContactView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      color: Colors.grey,
      width: kdDesktopMaxContentWidth,
      height: kdDesktopMaxContentHeight,
      child: Center(
        child: Text(
          "CONTACT SECTION\n Add contact details, email and everything. Maybe contact form in the future",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
