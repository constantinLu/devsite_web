import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../common/app_constants.dart';

class HomeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Right side of screen
    //Container(width: 450, color: Colors.amber),
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:

          // SvgPicture.asset(
          //   'assets/images/undraw-service.svg',
          //   height: double.infinity,
          //   width: kdDesktopMaxContentWidth * 0.4,
          //   fit: BoxFit.cover,
          // ),

          Image.asset(
        'assets/images/undraw_software_engineer.png',
        width: kdDesktopMaxContentWidth * 0.3,
        height:
            getValueForScreenType<double>(context: context, mobile: 650, desktop: double.infinity),
      ),
    );
  }
}
