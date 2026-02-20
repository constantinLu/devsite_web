import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import '../../common/app_routes.dart';

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
          Navigator.pushReplacementNamed(context, AppRoutes.pathForSection(widget.index));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(widget.label, style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
    ).showCursorOnHover.moveUpOnHover;
  }
}
