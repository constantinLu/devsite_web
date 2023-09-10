import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/presentation/widget/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../application/model/tags.dart';
import '../../application/provider/theme_provider.dart';
import '../common/color_picker.dart';
import '../common/device_size.dart';
import '../common/space.dart';

class ServiceCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final List<Tag>? tags;

  const ServiceCard(
      {super.key, required this.name, required this.description, required this.image, this.tags});

  @override
  Widget build(BuildContext context) {
    var backgroundColor = tags?.first.backgroundColor?.withOpacity(0.8);
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return SizedBox(
      width: DeviceSize.deviceWidth(context, 22.w, 30.w, 80.w),
      height: DeviceSize.deviceHeight(context, 50.h, 60.h, 60.h),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Card(
          shadowColor: kcGreyPlatinum,
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: DeviceSize.deviceWidth(context, 20.w, 22.w, 80.w),
                    height: 20.h,
                    decoration: BoxDecoration(color: backgroundColor ?? Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
                      child: SvgPicture.asset(
                        image,
                        fit: BoxFit.scaleDown,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                  ),
                ],
              ),
              Space.height(3.h)!,
              Padding(
                padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      color: provider.isDarkMode ? kcWhiteFull : kcBlackFull,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16).copyWith(bottom: 10),
                child: Text(
                  description,
                  style: const TextStyle(
                      fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Wrap(
                        runAlignment: WrapAlignment.start,
                        children: [
                          ...?tags?.map(
                            (tag) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                              child: TagWidget(tag, TagSize.M),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ).moveUpOnHover;
  }
}
