import 'package:devsite_web/application/provider/scroll_provider.dart';
import 'package:devsite_web/presentation/view/navbar/navbar.drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/body.dart';
import 'navbar/navbar.dart';

class MainView extends StatefulWidget {
  final int initialSection;

  const MainView({super.key, this.initialSection = 0});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Provider.of<ScrollProvider>(context, listen: false).jumpTo(widget.initialSection);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,

      /// APP BAR
      appBar: NavBar(),

      /// DRAWER
      drawer: NavbarDrawer(),

      /// BODY
      body: AllViews(),
    );
  }
}
