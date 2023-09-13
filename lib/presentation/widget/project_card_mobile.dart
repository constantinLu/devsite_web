import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/presentation/widget/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
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
    var cardHeight = 35.h;
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

  ConstrainedBox buildSizedBox(
      BuildContext context, double cardHeight, double cardWidth, bool isFrontCard) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size(cardWidth, cardHeight)),
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
              Flexible(
                //constrain withn space
                flex: 1,
                fit: FlexFit.loose,
                child: Container(
                  /// THIS IS THE WIDTH OF THE LOGO!!! total 100.w - 20.w
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
              ),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: isFrontCard
                    ? Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.name,
                              style: poppinsStyle(context, 20),
                            ),
                            Space.height(0.8.h)!,
                            Text(project.sector, style: robotoStyle(context, 15)),
                            Space.height(1.h)!,
                            Flexible(
                              fit: FlexFit.loose,
                              flex: determineFlex(project.description.length),
                              child: SizedBox(
                                /// THE length where the text will collapse afterwards 50% of the current width
                                width: 100.w,
                                height: cardHeight,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    "• ${project.description}",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines: 6,
                                    style: montserratStyleWithColor(
                                        context, 12, kcLightGrey, FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(fit: FlexFit.tight, flex: 1, child: Space.height(0.1.h)!),

                            /// tags !
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 2,
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
                            Flexible(fit: FlexFit.tight, flex: 2, child: Space.height(0.2.h)!),
                          ],
                        ),
                      )
                    : const Padding(padding: EdgeInsets.all(0)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color processColor(bool isFrontCard, ThemeProvider provider) {
    return isFrontCard ? (provider.isDarkMode ? kcDarkBackground : kcLightBackground) : kcBlackFull;
  }

  int determineFlex(int textLength) {
    if (textLength < 90) {
      return 1;
    } else if (textLength > 90 && textLength < 120) {
      return 3;
    } else {
      return 4;
    }
  }
}
