import 'package:devsite_web/presentation/view/navbar/navbar.drawer.dart';
import 'package:flutter/material.dart';

import '../widget/body.dart';
import 'navbar/navbar.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,

        /// APP BAR
        appBar: NavBar(),

        /// DRAWER
        drawer: NavbarDrawer(),

        /// BODY
        body: AllViews());
  }
}
