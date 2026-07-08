import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/presentation/widget/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo/seo.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../application/model/project.dart';
import '../../application/provider/theme_provider.dart';
import '../common/color_picker.dart';
import '../common/space.dart';
import '../common/style.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final hasUrl = widget.project.url != null;
    var height =
        getValueForScreenType<double>(context: context, mobile: 21.h, tablet: 21.h, desktop: 21.h);
    var width =
        getValueForScreenType<double>(context: context, mobile: 80.w, tablet: 50.w, desktop: 10.w);
    final Widget card = MouseRegion(
      cursor: hasUrl ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) {
        if (hasUrl && !_hovering) setState(() => _hovering = true);
      },
      onExit: (_) {
        if (_hovering) setState(() => _hovering = false);
      },
      child: GestureDetector(
        onTap: () {
          if (widget.project.url != null) {
            launchURL(widget.project.url!);
          }
        },
        child: Stack(
          children: [
            Transform.translate(
              offset: const Offset(-8, 8),
              //this is the back card
              child: buildSizedBox(context, height, width, false),
            ),
            // this is the front card
            buildSizedBox(context, height, width, true),
          ],
        ).moveUpOnHover,
      ),
    );

    if (!hasUrl) return card;
    return Seo.link(
      href: widget.project.url!,
      anchor: widget.project.name,
      child: card,
    );
  }

  SizedBox buildSizedBox(BuildContext context, double height, double width, bool isFrontCard) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    final project = widget.project;
    final hasLogo = (project.logo?.trim().isNotEmpty ?? false);
    final frontCardColor = processColor(true, provider);
    final fallbackTextColor = frontCardColor == kcDarkBackground ? Colors.white : Colors.black;

    final Widget cardRow = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: getValueForScreenType<double>(
              context: context, mobile: width, tablet: width, desktop: width),
          height: height,
          child: Stack(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.centerLeft,
            children: [
              Container(
                width: getValueForScreenType<double>(
                    context: context, mobile: 30.w, tablet: width, desktop: width),
                height: getValueForScreenType<double>(
                    context: context,
                    mobile: 10.h,
                    tablet: double.infinity,
                    desktop: double.infinity),
                decoration: BoxDecoration(color: processColor(isFrontCard, provider)),
              ),
              isFrontCard
                  ? hasLogo
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Seo.image(
                            src: project.logo!,
                            alt: project.name,
                            child: project.logo!.contains(".svg")
                                ? Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      project.logo!,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Image.asset(
                                      project.logo!,
                                      fit: BoxFit.fitWidth,
                                      width: 10.w,
                                      height: 15.h,
                                    ),
                                  ),
                          ),
                        )
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              project.name,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: poppinsStyle(
                                context,
                                22,
                                FontWeight.w700,
                                fallbackTextColor,
                              ).copyWith(
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        )
                  : const Padding(
                      padding: EdgeInsets.all(0),
                    )
            ],
          ),
        ),
        isFrontCard
            ? Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 5, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Name
                    Seo.text(
                      text: project.name,
                      style: TextTagStyle.h3,
                      child: Text(
                        project.name,
                        style: poppinsStyle(context, 20),
                      ),
                    ),
                    Space.height(0.2.w)!,

                    // Project Sector
                    Seo.text(
                      text: project.sector,
                      child: Text(project.sector, style: robotoStyle(context, 15)),
                    ),
                    Space.height(0.5.w)!,

                    //Project description
                    SizedBox(
                      width: 23.w,
                      child: Seo.text(
                        text: project.description,
                        child: Text(
                          "• ${project.description}",
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 5,
                          style: montserratStyle(context, 14, FontWeight.w400),
                        ),
                      ),
                    ),
                    Space.height(0.5.w)!,

                    // Project Tags
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
                          spacing: 5.0,
                          runSpacing: 5.0,
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
    );

    final bool showHint = isFrontCard && project.url != null;

    return SizedBox(
      width: getValueForScreenType<double>(
          context: context, mobile: width, tablet: 15.w, desktop: 35.w),
      height: getValueForScreenType<double>(
          context: context, mobile: height, tablet: height, desktop: height),
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
          child: showHint
              ? Stack(
                  children: [
                    cardRow,
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _buildVisitBar(context),
                    ),
                  ],
                )
              : cardRow,
        ),
      ),
    );
  }

  Widget _buildVisitBar(BuildContext context) {
    return IgnorePointer(
      child: AnimatedOpacity(
        opacity: _hovering ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeInOut,
        child: Container(
          height: 4.h,
          alignment: Alignment.center,
          color: kcTitleTurquoise.withOpacity(0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Visit website",
                style: montserratStyleWithColor(context, 14, kcBlackFull, FontWeight.w600),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.north_east, size: 16, color: kcBlackFull),
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

Future<void> launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch $url');
  }
}
