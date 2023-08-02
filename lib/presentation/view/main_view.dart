import 'package:devsite_web/presentation/common/ui_helpers.dart';
import 'package:flutter/material.dart';

import '../widget/body.dart';
import '../widget/navbar/navbar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = screenWidth(context);
    double height = screenHeight(context);

    //TODO FIX NAVBAR
    return Scaffold(
      /// APP BAR
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: NavBar(),
      ),

      /// BODY
      body: Stack(
        children: [
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
