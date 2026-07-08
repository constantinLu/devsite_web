import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/presentation/widget/project_card.dart' show launchURL;
import 'package:devsite_web/presentation/widget/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:seo/seo.dart';
import 'package:sizer/sizer.dart';

import '../../application/model/project.dart';
import '../../application/provider/theme_provider.dart';
import '../common/color_picker.dart';
import '../common/style.dart';

/// Content-sized project card (mobile + tablet-portrait). It has no fixed height
/// so the content always fits instead of being cropped; the logo is vertically
/// centered and the description wraps.
class ProjectCardMobile extends StatelessWidget {
  final Project project;

  const ProjectCardMobile({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final Widget stacked = Stack(
      children: [
        // Back card: same size as the front, offset to peek out behind it.
        Positioned.fill(
          child: Transform.translate(
            offset: const Offset(-8, 8),
            child: _backCard(),
          ),
        ),
        _frontCard(context),
      ],
    ).moveUpOnHover;

    // Touch has no hover, so make the whole card tappable when it links out.
    if (project.url == null) return stacked;
    return Seo.link(
      href: project.url!,
      anchor: project.name,
      child: GestureDetector(
        onTap: () => launchURL(project.url!),
        child: stacked,
      ),
    );
  }

  Widget _backCard() {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        color: kcBlackFull,
        shadowColor: kcBlackFull,
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        child: const SizedBox.expand(),
      ),
    );
  }

  Widget _frontCard(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    final cardColor = provider.isDarkMode ? kcDarkBackground : kcLightBackground;
    final fallbackTextColor = cardColor == kcDarkBackground ? Colors.white : Colors.black;
    final hasLogo = (project.logo?.trim().isNotEmpty ?? false);

    final Widget content = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // LOGO (or name fallback), vertically centered in its column.
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Center(
              child: hasLogo
                  ? Seo.image(
                      src: project.logo!,
                      alt: project.name,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 12.h),
                        child: project.logo!.contains(".svg")
                            ? SvgPicture.asset(project.logo!, fit: BoxFit.contain)
                            : Image.asset(project.logo!, fit: BoxFit.contain),
                      ),
                    )
                  : Text(
                      project.name,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: poppinsStyle(context, 16, FontWeight.w700, fallbackTextColor)
                          .copyWith(letterSpacing: 1.0),
                    ),
            ),
          ),
        ),
        // TEXT
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 18, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Seo.text(
                  text: project.name,
                  style: TextTagStyle.h3,
                  child: Text(project.name, style: poppinsStyle(context, 20)),
                ),
                const SizedBox(height: 6),
                Seo.text(
                  text: project.sector,
                  child: Text(project.sector, style: robotoStyle(context, 15)),
                ),
                const SizedBox(height: 12),
                Seo.text(
                  text: project.description,
                  child: Text(
                    "• ${project.description}",
                    softWrap: true,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: montserratStyleWithColor(context, 13, kcLightGrey, FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: project.tags.map((t) => TagWidget(t, TagSize.XS)).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        color: cardColor,
        shadowColor: cardColor,
        elevation: 12,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: const BorderSide(color: kcBlackFull, width: 3),
        ),
        child: project.url == null
            ? content
            : Stack(
                children: [
                  content,
                  // Persistent link badge (no hover on touch).
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: kcTitleTurquoise.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(Icons.north_east, size: 16, color: kcBlackFull),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
