import 'package:devsite_web/application/assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/messages.dart';

class DevsiteIcon extends StatelessWidget {
  final double iconHeight;
  final double iconWidth;

  const DevsiteIcon({Key? key, required this.iconHeight, required this.iconWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.devsiteCropped, fit: BoxFit.scaleDown);
  }

  //TODO: fix this on the icon when pop-up (can be done with tooltip - and move when hover)
  void _showHelloDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.black87,
            child: const Text(
              aboutHello,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
