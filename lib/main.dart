import 'package:devsite_web/presentation/app_widget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }

  runApp(const AppWidget());
}
