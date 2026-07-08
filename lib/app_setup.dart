import 'package:devsite_web/presentation/widget/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'presentation/common/app_typography.dart';
import 'presentation/common/space.dart';

class App {
  static init(BuildContext context) {
    Space.init();
    AppText.init();
    AppThemeUtil.init(context);
    // Treat tablets in landscape (up to ~1200px) as "tablet" so they use the
    // dedicated tablet layouts instead of the desktop ones.
    ResponsiveSizingConfig.instance.setCustomBreakpoints(
      const ScreenBreakpoints(desktop: 1200, tablet: 600, watch: 300),
    );
  }
}
