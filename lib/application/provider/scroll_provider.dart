import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollProvider extends ChangeNotifier {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final scrollDuration = const Duration(seconds: 2);

  void jumpTo(int index) {
    // Guard against calling before the list has attached (avoids the
    // scrollable_positioned_list attach assertion).
    if (!itemScrollController.isAttached) return;
    itemScrollController.scrollTo(
        index: index, duration: scrollDuration, curve: Curves.easeInOutCubic, alignment: 0);
  }
}
