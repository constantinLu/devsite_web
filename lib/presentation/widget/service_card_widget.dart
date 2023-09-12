import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/presentation/widget/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

import '../../application/model/tags.dart';
import '../../application/provider/theme_provider.dart';
import '../common/color_picker.dart';
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

    /// THIS SizedBox controls the dimension of the card.
    return SizedBox(
      height: getValueForScreenType<double>(
          context: context, mobile: 63.h, tablet: 52.h, desktop: 54.h),
      width: getValueForScreenType<double>(
          context: context, mobile: 85.w, tablet: 90.w, desktop: 20.w),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        //TODO: This prevents the bug of
        // https://stackoverflow.com/questions/72410116/physicalmodellayer-detached-when-rendering-card-flutter
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Card(
            shadowColor: kcGreyPlatinum,
            elevation: 3,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    /// THIS CONTAINER CONTROLS THE IMAGE dimension
                    Container(
                      height: getValueForScreenType<double>(
                          context: context, mobile: 20.h, tablet: 20.h, desktop: 20.h),
                      width: getValueForScreenType<double>(
                          context: context, mobile: 70.w, tablet: 70.w, desktop: 20.w),
                      decoration: BoxDecoration(color: backgroundColor ?? Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
                        child: SvgPicture.asset(
                          image,
                          fit: BoxFit.scaleDown,
                          height: getValueForScreenType<double>(
                              context: context, mobile: 20.h, tablet: 20.h, desktop: 20.h),
                          width: getValueForScreenType<double>(
                              context: context, mobile: 70.w, tablet: 20.w, desktop: 20.w),
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
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16).copyWith(bottom: 10),
                    child: Text(
                      description,
                      style: const TextStyle(
                          fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
                    ),
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
                        SizedBox(
                          width: getValueForScreenType<double>(
                              context: context, mobile: 40.w, tablet: 15.w, desktop: 15.w),
                          child: Wrap(
                            runAlignment: WrapAlignment.start,
                            spacing: 6,
                            runSpacing: 4,
                            children: [
                              ...?tags?.map(
                                (tag) => TagWidget(tag, TagSize.M),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ).moveUpOnHover;
  }
}
