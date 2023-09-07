import 'package:flutter/material.dart';

import '../../application/model/tags.dart';
import '../common/color_picker.dart';

enum TagSize { XS, S, M, L, XL }

class TagWidget extends StatelessWidget {
  final Tag tag;
  final TagSize size;

  const TagWidget(this.tag, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: tag.override ? kcGreySpanish : tag.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        "#${tag.name}",
        style: TextStyle(
          color: tag.override ? kcBlackFull : tag.color,
          fontWeight: FontWeight.bold,
          fontSize: tagSize(size, context),
        ),
      ),
    );
  }
}

double tagSize(TagSize size, BuildContext context) {
  var theme = Theme.of(context).textTheme;
  switch (size) {
    case TagSize.XS:
      return theme.bodySmall?.fontSize! ?? 12;
    case TagSize.M:
      return 16;
    default:
      return 12;
  }
}
