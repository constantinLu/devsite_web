import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/provider/scroll_provider.dart';
import '../common/color_picker.dart';

enum BtnSize { XS, S, M, L, XL }

class RetroButton extends StatefulWidget {
  final String label;
  final int? index;
  final Size? btnSize;

  const RetroButton({super.key, required this.label, this.index, this.btnSize});

  @override
  State<RetroButton> createState() => _RetroButtonState();
}

class _RetroButtonState extends State<RetroButton> {
  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final textStyle = Theme.of(context).textTheme.headlineSmall;

    return Stack(
      children: [
        //BACKGROUND BUTTON
        Transform.translate(
          offset: const Offset(-7, 7),
          child: ElevatedButton(
            onPressed: () {}, //DO NOTHING SINCE IS THE BACKGROUND
            style: ElevatedButton.styleFrom(
              backgroundColor: kcBlackFull,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              elevation: 4,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.label,
                style: textStyle?.copyWith(color: kcBlackFull),
              ),
            ),
          ),
        ),

        // SECOND BUTTON
        ElevatedButton(
          onPressed: () {
            scrollProvider.jumpTo(widget.index ?? 3);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kcTitleTurquoise,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: const BorderSide(
                color: kcBlackFull,
                width: 1.5,
              ),
            ),
            elevation: 4,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.label,
              style: textStyle?.copyWith(color: kcBlackFull),
            ),
          ),
        ),
      ],
    ).showCursorOnHover.moveUpOnHover;
  }
}
