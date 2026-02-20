import 'package:devsite_web/application/provider/scroll_provider.dart';
import 'package:devsite_web/presentation/common/app_routes.dart';
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
  late final ScrollProvider _scrollProvider;

  @override
  void initState() {
    super.initState();
    _scrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    _scrollProvider.itemPositionsListener.itemPositions.addListener(_onSectionChangedByScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _scrollProvider.jumpTo(widget.initialSection);
    });
  }

  @override
  void dispose() {
    _scrollProvider.itemPositionsListener.itemPositions.removeListener(_onSectionChangedByScroll);
    super.dispose();
  }

  void _onSectionChangedByScroll() {
    if (!mounted) return;

    final visibleItems = _scrollProvider.itemPositionsListener.itemPositions.value
        .where((position) => position.itemTrailingEdge > 0)
        .toList();

    if (visibleItems.isEmpty) return;

    visibleItems.sort((a, b) => a.itemLeadingEdge.compareTo(b.itemLeadingEdge));
    final currentIndex = visibleItems.first.index;
    final routeSection = currentIndex > 3 ? 3 : currentIndex;
    final nextRoute = AppRoutes.pathForSection(routeSection);
    final currentRoute = ModalRoute.of(context)?.settings.name;

    if (currentRoute == nextRoute) return;

    Navigator.pushReplacementNamed(context, nextRoute);
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
