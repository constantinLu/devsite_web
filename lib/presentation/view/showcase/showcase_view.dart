import 'package:flutter/material.dart';

import '../../common/app_constants.dart';

class ShowcaseView extends StatelessWidget {
  const ShowcaseView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      color: Colors.green,
      width: kdDesktopMaxContentWidth,
      height: kdDesktopMaxContentHeight,
      child: Center(
        child: Text(
          "SHOWCASE SECTION\n Here I'll add some past projects and a couple past clients",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
