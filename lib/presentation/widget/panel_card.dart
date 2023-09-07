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

class PanelCard extends StatelessWidget {
  final Project project;
  final int? index;
  final Size? panelSize;

  const PanelCard({super.key, required this.project, this.index, this.panelSize});

  @override
  Widget build(BuildContext context) {
    var width = 10.w;
    var height = 20.h;
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(-8, 8),
          child: buildSizedBox(context, height, width, true),
        ),
        buildSizedBox(context, height, width, false),
      ],
    ).moveUpOnHover;
  }

  SizedBox buildSizedBox(BuildContext context, double height, double width, bool isFrontCard) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return SizedBox(
      width: 35.w,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Card(
          shadowColor: (provider.isDarkMode ? kcDarkBackground : kcLightBackground),
          color: isFrontCard
              ? (provider.isDarkMode ? kcDarkBackground : kcLightBackground)
              : (provider.isDarkMode ? kcDarkBackground : kcLightBackground),
          elevation: 12,
          clipBehavior: Clip.antiAlias,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
            side: BorderSide(
              color: isFrontCard
                  ? (provider.isDarkMode ? kcDarkBackground : kcLightBackground)
                  : (provider.isDarkMode ? kcDarkBackground : kcLightBackground),
              width: isFrontCard ? 0 : 3,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                height: height,
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: width,
                      height: height,
                      decoration: BoxDecoration(
                          color: isFrontCard
                              ? (provider.isDarkMode ? kcDarkBackground : kcLightBackground)
                              : (provider.isDarkMode ? kcDarkBackground : kcLightBackground)),
                    ),
                    isFrontCard
                        ? const Padding(
                            padding: EdgeInsets.all(0),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: project.logo!.contains(".svg")
                                ? SvgPicture.asset(
                                    project.logo!,
                                    fit: BoxFit.scaleDown,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Image.asset(
                                      project.logo!,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                          ),
                  ],
                ),
              ),
              isFrontCard
                  ? const Padding(padding: EdgeInsets.all(0))
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 5, 5, 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.name,
                            style: poppinsStyle(context, 20),
                          ),
                          Space.height(0.2.w)!,
                          Text(project.sector, style: robotoStyle(context, 15)),
                          Space.height(0.5.w)!,
                          SizedBox(
                            //THE length where the text will colapse afterwards
                            width: 23.w,
                            child: Text(
                              "• ${project.description}",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              maxLines: 5,
                              style: montserratStyle(context, 14),
                            ),
                          ),
                          Space.height(0.5.w)!,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ...project.tags.take(4).map(
                                    (tag) => Padding(
                                      padding: const EdgeInsets.fromLTRB(4, 6, 4, 4),
                                      child: TagWidget(tag, TagSize.XS),
                                    ),
                                  ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ...project.tags.skip(4).map(
                                    (tag) => Padding(
                                      padding: const EdgeInsets.fromLTRB(4, 6, 4, 4),
                                      child: TagWidget(tag, TagSize.XS),
                                    ),
                                  ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
