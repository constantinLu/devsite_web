import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/presentation/widget/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizer/sizer.dart';

import '../../application/model/project.dart';
import '../../application/provider/theme_provider.dart';
import '../common/color_picker.dart';
import '../common/space.dart';
import '../common/style.dart';

enum PanelSize { XS, S, M, L, XL }

class ProjectCardMobile extends StatelessWidget {
  final Project project;
  final int? index;
  final Size? panelSize;

  const ProjectCardMobile({super.key, required this.project, this.index, this.panelSize});

  @override
  Widget build(BuildContext context) {
    var cardHeight = 30.h;
    var cardWidth = 100.w;
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(-8, 8),
          //this is the back card
          child: buildSizedBox(context, cardHeight, cardWidth, false),
        ),
        // this is the front card
        buildSizedBox(context, cardHeight, cardWidth, true),
      ],
    ).moveUpOnHover;
  }

  SizedBox buildSizedBox(
      BuildContext context, double cardHeight, double cardWidth, bool isFrontCard) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return SizedBox(
      width: cardWidth,
      height: cardHeight,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Card(
          shadowColor: processColor(isFrontCard, provider),
          color: processColor(isFrontCard, provider),
          elevation: 12,
          clipBehavior: Clip.antiAlias,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: BorderSide(
              color: kcBlackFull,
              width: isFrontCard ? 3 : 0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                /// THIS IS THE WIDTH OF THE LOGO!!!
                width: 20.w,
                height: cardHeight,
                decoration: BoxDecoration(color: processColor(isFrontCard, provider)),
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.centerLeft,
                  children: [
                    isFrontCard
                        ? Padding(
                            padding: const EdgeInsets.only(left: 2.0, right: 5),
                            child: project.logo!.contains(".svg")
                                ? SvgPicture.asset(
                                    project.logo!,
                                    fit: BoxFit.fitWidth,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(left: 10.0, right: 5),
                                    child: Image.asset(
                                      project.logo!,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                          )
                        : const Padding(
                            padding: EdgeInsets.all(0),
                          ),
                  ],
                ),
              ),
              isFrontCard
                  ? Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.name,
                            style: poppinsStyle(context, 20),
                          ),
                          Space.height(0.8.h)!,
                          Text(project.sector, style: robotoStyle(context, 15)),
                          Space.height(1.h)!,
                          SizedBox(
                            /// THE length where the text will collapse afterwards 50% of the current width
                            width: 50.w,
                            child: Text(
                              "• ${project.description}",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 5,
                              style: montserratStyle(context, 14, FontWeight.w400),
                            ),
                          ),
                          Space.height(0.8.h)!,
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: getValueForScreenType<double>(
                                  context: context, mobile: 50.w, tablet: 15.w, desktop: 23.w),
                              height: getValueForScreenType<double>(
                                  context: context,
                                  mobile: 20.h,
                                  tablet: double.infinity,
                                  desktop: double.infinity),
                              child: Wrap(
                                spacing: 5.0, // Horizontal spacing between items
                                runSpacing: 5.0, // Vertical spacing between lines
                                runAlignment: WrapAlignment.start,
                                children: project.tags
                                    .map(
                                      (tag) => TagWidget(tag, TagSize.XS),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const Padding(padding: EdgeInsets.all(0))
            ],
          ),
        ),
      ),
    );
  }

  Color processColor(bool isFrontCard, ThemeProvider provider) {
    return isFrontCard ? (provider.isDarkMode ? kcDarkBackground : kcLightBackground) : kcBlackFull;
  }
}
