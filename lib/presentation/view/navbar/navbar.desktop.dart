import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/presentation/common/color_picker.dart';
import 'package:devsite_web/presentation/widget/retro_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    // theme
    var theme = Theme.of(context);
    //return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
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
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            icon: Icon(false ? FontAwesomeIcons.solidMoon : FontAwesomeIcons.solidSun,
                color: kcYellowBouldare),
            onPressed: () {
              //TODO: change the theme when pressed.
              //TODO: add giggle animation on the icon.
              // change color to yellow for the sun // whine for the moon and so on.
            },
          ).showCursorOnHover.moveUpOnHover,
        ],
      ),
    );
  }
//);
}

// class _NavBarTablet extends StatelessWidget {
//   const _NavBarTablet({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final drawerProvider = Provider.of<DrawerProvider>(context);
//     var theme = Theme.of(context);
//     return Container(
//       color: theme.navBarColor,
//       padding: EdgeInsets.symmetric(
//           horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
//       child: Row(
//         children: [
//           IconButton(
//             highlightColor: Colors.white54,
//             onPressed: () {
//               drawerProvider.key.currentState!.openDrawer();
//             },
//             icon: const Icon(Icons.menu),
//           ),
//           Space.xm!,
//           const NavBarLogo(),
//           // Space.x1!,
//         ],
//       ),
//     );
//   }
// }
