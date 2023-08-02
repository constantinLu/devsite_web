import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../application/provider/scroll_provider.dart';
import '../view/contact/contact_view.dart';
import '../view/footer/footer_view.dart';
import '../view/home/home_view.dart';
import '../view/services/service_view.dart';
import '../view/showcase/showcase_view.dart';

class AllViews extends StatelessWidget {
  static const List<Widget> views = [
    HomeView(),
    ServiceView(),
    ShowcaseView(),
    ContactView(),
    FooterView(),
  ];

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return ScrollablePositionedList.builder(
      padding: EdgeInsets.zero,
      itemCount: AllViews.views.length,
      itemBuilder: (context, index) => AllViews.views[index],
      itemScrollController: scrollProvider.itemScrollController,
    );
  }
}
