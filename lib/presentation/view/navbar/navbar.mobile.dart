import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../application/provider/theme_provider.dart';
import '../../common/navbar_utils.dart';
import '../../widget/devsite_icon.dart';

class NavbarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Drawer(
      child: Column(
        children: [
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //       // Add your header decoration here
          //       ),
          //   child: const DevsiteIcon(iconHeight: 10, iconWidth: 15),
          // ),
          // ...NavBarUtils.names.asMap().entries.map(
          //       (e) => ListTile(
          //         title: Text(e.value),
          //         onTap: () {
          //           // Handle your navigation here
          //         },
          //       ),
          //     ),
          Spacer(),
          ListTile(
            title: Text('ABOUT US'),
            onTap: () {
              // Handle your 'Contact Us' navigation here
            },
          ),
          ListTile(
            title: Text('CONTACT US'),
            onTap: () {
              // Handle your 'Contact Us' navigation here
            },
          ),
          // ListTile(
          //   title:
          //       Icon(provider.isDarkMode ? FontAwesomeIcons.solidMoon : FontAwesomeIcons.solidSun),
          //   onTap: () {
          //     provider.toggleTheme(); // Toggle the theme
          //   },
         // ),
        ],
      ),
    );
  }
}
