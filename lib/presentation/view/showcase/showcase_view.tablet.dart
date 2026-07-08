import 'package:devsite_web/application/extensions/date_extension.dart';
import 'package:devsite_web/presentation/common/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../application/model/project.dart';
import '../../common/messages.dart';
import '../../common/space.dart';
import '../../widget/animation/up_down_animation.dart';
import '../../widget/project_card_mobile.dart';

/// Dedicated tablet layout: the vertical project timeline, centered and capped
/// to a comfortable tablet reading width so cards don't stretch edge to edge.
class ShowcaseTabletView extends StatelessWidget {
  const ShowcaseTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(showcaseTitle, style: Theme.of(context).textTheme.displaySmall),
              ),
              Space.height(3.h)!,
              FixedTimeline.tileBuilder(
                mainAxisSize: MainAxisSize.min,
                theme: TimelineThemeData(
                  color: kcTitleTurquoise,
                  nodePosition: 0.12,
                  nodeItemOverlap: true,
                ),
                builder: TimelineTileBuilder.connectedFromStyle(
                  contentsAlign: ContentsAlign.basic,
                  itemCount: projects.length,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
                    child: ProjectCardMobile(project: projects[index]),
                  ),
                  oppositeContentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      projects[index].startDate.monthYear,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  connectorStyleBuilder: (context, index) => ConnectorStyle.dashedLine,
                  indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                ),
              ),
              Space.height(4.h)!,
              const IconAnimation(
                  icon: Icon(Icons.keyboard_double_arrow_down, size: 70, color: kcDevsiteTurquise)),
            ],
          ),
        ),
      ),
    );
  }
}
