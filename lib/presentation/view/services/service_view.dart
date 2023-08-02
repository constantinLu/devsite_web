import 'package:flutter/material.dart';

import '../../common/app_constants.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      color: Colors.black,
      width: kdDesktopMaxContentWidth,
      height: kdDesktopMaxContentHeight,
      child: Center(
        child: Text(
          "DEVSITE SERICES SECTION\n Here I'll present the IT Services available",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
