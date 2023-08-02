import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../common/app_colors.dart';
import '../../common/shared_styles.dart';
import '../../common/ui_helpers.dart';
import '../retro_button.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height + 100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: heightPercentOf(20, context),
      elevation: 0,
      backgroundColor: kcBackgroundColor,
      title: SvgPicture.asset(
        "assets/images/devbutton.svg",
        width: widthPercentOf(50, context),
        height: heightPercentOf(50, context),
      ),
      actions: [
        /// ASTEA 3 PE MIJLOC
        TextButton(
          child: Text(
            "Services",
            style: ktsTTCommons,
          ),
          onPressed: () {},
        ).scaleOnHover().moveOnHover(
              y: -5,
              x: getValueForScreenType<double>(
                context: context,
                mobile: -20,
                tablet: 0,
                desktop: 0,
              ),
            ),
        TextButton(
          child: Text(
            "Showcase",
            style: ktsTTCommons,
          ),
          onPressed: () {},
        ).scaleOnHover().moveOnHover(
              y: -5,
              x: getValueForScreenType<double>(
                context: context,
                mobile: -20,
                tablet: 0,
                desktop: 0,
              ),
            ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(200.0, 30.0, 100.0, 30.0),
            child: const RetroButton(text: "Contact us").scaleOnHover().moveOnHover(
                  y: -5,
                  x: getValueForScreenType<double>(
                    context: context,
                    mobile: -20,
                    tablet: 0,
                    desktop: 0,
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
