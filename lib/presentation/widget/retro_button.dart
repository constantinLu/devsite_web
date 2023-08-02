import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/shared_styles.dart';
import '../common/ui_helpers.dart';

class RetroButton extends StatelessWidget {
  final String text;

  const RetroButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            elevation: 4,
          ),
          child: SizedBox(
            width: widthPercentOf(10, context),
            height: heightPercentOf(3, context),
          ),
        ),
        Positioned(
          left: 6,
          top: -6,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 4,
                backgroundColor: kcTitleTurquoise,
                side: BorderSide(color: Colors.black, width: 0)),
            child: SizedBox(
              width: widthPercentOf(10, context),
              height: heightPercentOf(3, context),
              child: Center(
                child: Text(text, style: ktsTTCommons.copyWith(color: kcBlackCarbon)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
