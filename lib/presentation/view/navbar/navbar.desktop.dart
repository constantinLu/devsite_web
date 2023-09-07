import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/application/provider/theme_provider.dart';
import 'package:devsite_web/presentation/common/color_picker.dart';
import 'package:devsite_web/presentation/widget/retro_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../common/navbar_utils.dart';
import '../../widget/devsite_icon.dart';
import '../../widget/navbar_button.dart';

class NavbarDesktop extends StatefulWidget {
  const NavbarDesktop({Key? key}) : super(key: key);

  @override
  State<NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<NavbarDesktop> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
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
          Tooltip(
            richMessage: TextSpan(
              text: provider.isDarkMode ? "\u{1F4A4}" : "\u{1F30A}",
              style: const TextStyle(
                color: kcGreyDim,
                fontSize: 16.0,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              icon: provider.isDarkMode
                  ? const Icon(FontAwesomeIcons.solidMoon, color: kcGreyDim)
                  : const Icon(FontAwesomeIcons.solidSun, color: kcYellowBouldare),
              onPressed: () {
                provider.toggleTheme(); // Toggle the theme
              },
            ).showCursorOnHover.moveUpOnHover,
          ),
        ],
      ),
    );
  }
}
