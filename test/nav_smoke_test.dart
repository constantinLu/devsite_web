// Regression test for navbar navigation.
//
// The nav buttons used to push a replacement route, which recreated the
// ScrollablePositionedList while the old one was still mounted; both shared the
// single ItemScrollController and tripped an attach assertion, so tapping a nav
// button did nothing. They now scroll the existing list via ScrollProvider.
//
// This test taps SHOWCASE and asserts (a) no non-overflow exception is thrown,
// and (b) the "S H O W C A S E" section actually scrolls into view.
import 'package:devsite_web/presentation/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _pumpFrames(WidgetTester tester, {int frames = 12}) async {
  // pumpAndSettle can't be used: the app has repeatForever animations.
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 300));
  }
}

void main() {
  testWidgets('tapping SHOWCASE scrolls the showcase section into view',
      (tester) async {
    // Overflow warnings in the cards are cosmetic; collect errors ourselves so
    // a real (non-overflow) exception like the old attach assertion fails loud.
    final errors = <String>[];
    final prev = FlutterError.onError;
    FlutterError.onError = (details) => errors.add(details.exceptionAsString());
    addTearDown(() => FlutterError.onError = prev);

    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const AppWidget());
    await _pumpFrames(tester);

    expect(find.text('S H O W C A S E').evaluate(), isEmpty,
        reason: 'showcase section should be off-screen before navigating');

    await tester.tap(find.text('SHOWCASE').first, warnIfMissed: false);
    await _pumpFrames(tester, frames: 20);

    final nonOverflow =
        errors.where((e) => !e.toLowerCase().contains('overflow')).toList();
    expect(nonOverflow, isEmpty,
        reason: 'navigation threw a real exception:\n${nonOverflow.join("\n")}');

    expect(find.text('S H O W C A S E'), findsWidgets,
        reason: 'showcase section should have scrolled into view after tapping SHOWCASE');
  });
}
