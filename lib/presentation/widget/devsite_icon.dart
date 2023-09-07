import 'package:devsite_web/application/assets/app_assets.dart';
import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/color_picker.dart';

class DevsiteIcon extends StatelessWidget {
  final double iconHeight;
  final double iconWidth;

  const DevsiteIcon({Key? key, required this.iconHeight, required this.iconWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      richMessage: TextSpan(
        text: greet(),
        style: const TextStyle(
          color: kcGreyDim,
          fontSize: 16.0,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SvgPicture.asset(AppAssets.devButton, fit: BoxFit.cover),
      ).moveUpOnHover,
    );
  }
}

String greet() {
  final currentTime = DateTime.now();
  final hour = currentTime.hour;

  String greeting;

  if (hour < 12) {
    greeting = 'Hey, good morning!';
  } else if (hour < 17) {
    greeting = 'Hey, Good afternoon!';
  } else {
    greeting = 'Hey, Good evening!';
  }

  return " \u{1F44B} $greeting";
}
