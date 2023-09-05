import 'dart:ui';

import 'package:devsite_web/presentation/common/device_size.dart';
import 'package:devsite_web/presentation/deprecated/ui_helpers.dart';
import 'package:flutter/material.dart';

import '../widget/body.dart';
import 'navbar/navbar.dart';
import 'navbar/navbar.mobile.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = getScreenWidth(context);
    double height = getScreenHeight(context);

    return Scaffold(
      extendBodyBehindAppBar: false,

      /// APP BAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(heightPercentOf(12, context)),
        child: NavBar(),
      ),

      /// DRAWER
      drawer: DeviceSize.isDesktop(context) ? null : NavbarMobile(),

      /// BODY
      body: Stack(
        children: [
          Positioned(
            top: height * 0.2,
            left: -88,
            child: Container(
              //TODO: change this if you want to change the c\
              //origina: height / 3 , widith = 166 - This is used or the sun like animation
              height: height / 3,
              width: 166,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                child: Container(
                  height: 166,
                  width: 166,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          AllViews(),
        ],
      ),
    );
  }
}

//TODO: DELETE WHEN NOT NEEDED
// Row(
//   mainAxisSize: MainAxisSize.max,
//   children: [
//     // LEFT SIDE
//     const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         DevsiteIcon(),
//         Spacer(flex: 2),
//         HomeTitle(),
//         HomeSubtitle(),
//
//         // Arrow
//         verticalSpaceMedium,
//
//         // Padding(
//         //   padding: const EdgeInsets.symmetric(horizontal: 100),
//         //   child: SvgPicture.asset('assets/undraw_software_engineer.png'),
//         // ),
//         verticalSpaceSmall,
//         Spacer(flex: 3)
//       ],
//     ),
//     HomeImage()
//   ],
// ),
