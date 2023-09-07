import 'dart:ui';

import 'package:devsite_web/presentation/deprecated/ui_helpers.dart';
import 'package:flutter/material.dart';

import '../widget/body.dart';
import 'navbar/navbar.dart';

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
      //drawer: NavBar(),

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
