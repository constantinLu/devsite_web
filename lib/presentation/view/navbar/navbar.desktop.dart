import 'package:devsite_web/presentation/widget/retro_button.dart';
import 'package:devsite_web/presentation/widget/theme_button.dart';
import 'package:flutter/material.dart';

import '../../common/navbar_utils.dart';
import '../../widget/devsite_icon.dart';
import '../../widget/navbar_button.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(flex: 5, child: DevsiteIcon(iconHeight: 800, iconWidth: 100)),
          const Expanded(flex: 4, child: SizedBox(width: double.infinity)),
          ...NavBarUtils.names.asMap().entries.map(
                (e) => NavbarButton(
                  label: e.value,
                  index: e.key,
                ),
              ),
          const Expanded(flex: 3, child: SizedBox(width: double.infinity)),
          RetroButton(label: 'CONTACT US', index: 3),
          ThemeButton(),
        ],
      ),
    );
  }
}
