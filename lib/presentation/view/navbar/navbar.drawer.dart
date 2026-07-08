import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../application/provider/scroll_provider.dart';
import '../../common/app_routes.dart';
import '../../common/navbar_utils.dart';
import '../../common/space.dart';
import '../../widget/devsite_icon.dart';
import '../../widget/retro_button.dart';

class NavbarDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                // Add your header decoration here
                ),
            child: const DevsiteIcon(iconHeight: 10, iconWidth: 15),
          ),
          ...NavBarUtils.names.asMap().entries.map(
                (e) => ListTile(
                  title: Text(e.value),
                  onTap: () {
                    Navigator.pop(context);
                    Provider.of<ScrollProvider>(context, listen: false).jumpTo(e.key);
                  },
                ),
              ),
          Space.height(4.h)!,
          RetroButton(
              label: 'CONTACT US',
              onPressed: () {
                Navigator.pop(context);
                Provider.of<ScrollProvider>(context, listen: false)
                    .jumpTo(AppRoutes.sectionFor(AppRoutes.contact));
              }),
        ],
      ),
    );
  }
}
