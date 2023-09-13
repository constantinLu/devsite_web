import 'package:devsite_web/presentation/widget/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../application/provider/theme_provider.dart';

class NavbarMobile extends StatelessWidget {
  NavbarMobile();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Container(
      height: 6.h,
      child: AppBar(
        backgroundColor: provider.getTheme().scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: provider.getOppositeColor()),
        elevation: 0,
        actions: [ThemeButton()],
      ),
    );
  }
}
