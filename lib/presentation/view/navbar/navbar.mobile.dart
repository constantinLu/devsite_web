import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/provider/theme_provider.dart';

class NavbarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      drawer: Drawer(
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
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Cooking up!',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Theme.of(context).primaryColor),
              ),
            ),
            Spacer(),
            ListTile(
              title: Text('ABOUT US',),
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
      ),
    );
  }
}
