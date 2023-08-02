import 'package:flutter/material.dart';

import '../../common/app_constants.dart';

class HomeViewDesktop extends StatelessWidget {
  const HomeViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ListView(
        children: [
          //TITLE - DEVSITE
          Container(
            padding: EdgeInsets.all(50),
            color: Colors.redAccent,
            width: kdDesktopMaxContentWidth,
            height: kdDesktopMaxContentHeight,
            child: Column(
              children: [
                Image.asset(
                  "assets/gif/logo_gif_transparent.gif",
                  height: 500.0,
                  width: 500.0,
                ),
                Center(
                  child: Text(
                    "DEVSITE TITLE SECTION\n The Short animation logo, And some catchy short story",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],
            ),
          ),

          // SERVICES -
          Container(
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
          ),

          // SHOWCASE
          Container(
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
          ),

          // CONTACT
          Container(
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
          ),

          //FOOTER
          Container(
            padding: EdgeInsets.all(50),
            color: Colors.blue,
            width: kdDesktopMaxContentWidth,
            height: kdDesktopMaxContentHeight - 400,
            child: Text(
              "FOOTER SECTION DATA\n LIKE: company logo on the left\n copyright, company address, maybe\n "
                  "Links to Social Media, Instagram, Linkedin, github, medium, whatsup, telegram ",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ],
      ),

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
    );
  }
}
