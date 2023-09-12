import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class TagView extends StatelessWidget {
  const TagView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 2),
      ),
    );
  }
}
