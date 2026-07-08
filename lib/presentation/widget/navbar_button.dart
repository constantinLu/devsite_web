import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/provider/scroll_provider.dart';

class NavbarButton extends StatefulWidget {
  final String label;
  final int index;

  const NavbarButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  State<NavbarButton> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton> {
  @override
  Widget build(BuildContext context) {
    // theme
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextButton(
        onPressed: () {
          // Scroll the existing single-page list instead of pushing a new route
          // (which recreated the list and broke the shared scroll controller).
          Provider.of<ScrollProvider>(context, listen: false).jumpTo(widget.index);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(widget.label, style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
    ).showCursorOnHover.moveUpOnHover;
  }
}
