import 'package:devsite_web/presentation/widget/app_theme.dart';
import 'package:flutter/material.dart';

import 'presentation/common/app_typography.dart';
import 'presentation/common/space.dart';

class App {
  static init(BuildContext context) {
    Space.init();
    AppText.init();
    AppThemeUtil.init(context);
  }
}
