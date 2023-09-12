import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../application/provider/theme_provider.dart';
import '../common/color_picker.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Tooltip(
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
          provider.toggleTheme();
        },
      ).showCursorOnHover.moveUpOnHover,
    );
  }
}
