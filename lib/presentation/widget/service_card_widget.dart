import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/presentation/widget/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo/seo.dart';
import 'package:sizer/sizer.dart';

import '../../application/model/tags.dart';
import '../../application/provider/theme_provider.dart';
import '../common/color_picker.dart';

/// Content-sized service card: a fixed width but intrinsic height, so the full
/// description and tags always fit instead of being cropped by a tight box.
class ServiceCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final List<Tag>? tags;

  const ServiceCard(
      {super.key, required this.name, required this.description, required this.image, this.tags});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = tags?.first.backgroundColor?.withOpacity(0.8);
    final provider = Provider.of<ThemeProvider>(context, listen: true);

    return SizedBox(
      width: getValueForScreenType<double>(
          context: context, mobile: 90.w, tablet: 80.w, desktop: 22.w),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        child: Card(
          shadowColor: kcGreyDim,
          elevation: 9,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner image
              Container(
                height: getValueForScreenType<double>(
                    context: context, mobile: 20.h, tablet: 20.h, desktop: 22.h),
                width: double.infinity,
                decoration: BoxDecoration(color: backgroundColor ?? Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.all(12).copyWith(bottom: 8),
                  child: Seo.image(
                    src: image,
                    alt: name,
                    child: SvgPicture.asset(image, fit: BoxFit.scaleDown),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Seo.text(
                  text: name,
                  style: TextTagStyle.h2,
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 20,
                        color: provider.darkMode() ? kcWhiteFull : kcBlackFull,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
                child: Seo.text(
                  text: description,
                  child: Text(
                    description,
                    style: const TextStyle(
                        fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    ...?tags?.map((tag) => TagWidget(tag, TagSize.M)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).moveUpOnHover,
    );
  }
}
