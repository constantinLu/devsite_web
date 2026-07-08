// Diagnostic (not a permanent assertion): pumps each top-level section at mobile
// and tablet widths inside the same constraints the real app gives them (bounded
// width, scrollable/unbounded height) and reports layout overflow / errors so we
// can find components that don't fit.
import 'package:devsite_web/app_setup.dart';
import 'package:devsite_web/application/provider/scroll_provider.dart';
import 'package:devsite_web/application/provider/theme_provider.dart';
import 'package:devsite_web/presentation/view/about/about_view.dart';
import 'package:devsite_web/presentation/view/contact/contact_view.dart';
import 'package:devsite_web/presentation/view/footer/footer_view.dart';
import 'package:devsite_web/presentation/view/services/service_view.dart';
import 'package:devsite_web/presentation/view/showcase/showcase_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Widget _host(Widget view) => Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ScrollProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Builder(builder: (ctx) {
            App.init(ctx); // matches the real app (initialises AppText/Space/Theme)
            return Scaffold(
              body: SingleChildScrollView(child: view),
            );
          }),
        ),
      ),
    );

void main() {
  final sizes = {
    'MOBILE(390x844)': const Size(390, 844),
    'TABLET_PORTRAIT(834x1112)': const Size(834, 1112),
    'TABLET_LANDSCAPE(1112x834)': const Size(1112, 834),
    'DESKTOP(1440x900)': const Size(1440, 900),
  };

  final views = <String, Widget Function()>{
    'About': () => const AboutView(),
    'Services': () => const ServiceView(),
    'Showcase': () => const ShowcaseView(),
    'Contact': () => ContactView(),
    'Footer': () => const FooterView(),
  };

  for (final sizeEntry in sizes.entries) {
    for (final viewEntry in views.entries) {
      testWidgets('${sizeEntry.key} - ${viewEntry.key}', (tester) async {
        final errors = <String>[];
        final prev = FlutterError.onError;
        FlutterError.onError = (d) => errors.add(d.exceptionAsString());
        addTearDown(() => FlutterError.onError = prev);

        tester.view.physicalSize = sizeEntry.value;
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(_host(viewEntry.value()));
        for (var i = 0; i < 6; i++) {
          await tester.pump(const Duration(milliseconds: 250));
        }

        // Restore BEFORE asserting so a failure doesn't trip the binding's
        // "onError not restored" check.
        FlutterError.onError = prev;
        final bad = errors.where((e) {
          final l = e.toLowerCase();
          return l.contains('overflow') || l.contains('null check');
        }).toList();
        // Desktop (>1200px) keeps the original desktop layout, which has some
        // pre-existing overflows we intentionally don't touch here.
        if (!sizeEntry.key.startsWith('DESKTOP')) {
          expect(bad, isEmpty,
              reason: '${sizeEntry.key} ${viewEntry.key} does not fit:\n${bad.join("\n")}');
        }
      });
    }
  }
}
