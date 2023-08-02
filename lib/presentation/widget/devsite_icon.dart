import 'package:flutter/material.dart';

import '../common/shared_styles.dart';

class DevsiteIcon extends StatelessWidget {
  const DevsiteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'DEVsite',
      style: ktsBodyRegular.copyWith(fontWeight: FontWeight.w800),
    );
  }
}
