import 'package:devsite_web/presentation/common/ui_helpers.dart';
import 'package:devsite_web/presentation/view/home/home_view.dart';
import 'package:devsite_web/presentation/widget/navbar/navbar.desktop.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      body: HomeView(),
    );
  }



