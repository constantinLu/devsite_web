import 'package:devsite_web/application/extensions/date_extension.dart';
import 'package:devsite_web/presentation/widget/project_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../application/model/project.dart';
import '../../common/color_picker.dart';
import '../../common/messages.dart';
import '../../common/space.dart';
import '../../widget/animation/up_down_animation.dart';

class ShowcaseMobileView extends StatelessWidget {
  const ShowcaseMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 2.w),
      // No fixed height: the section sizes to its content so it always fits,
      // regardless of how many projects are added.
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ROW 1 - 3 elements
          Center(
            child: Text(
              showcaseTitle,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Space.height(3.h)!,
          FixedTimeline.tileBuilder(
            // Size to content (default MainAxisSize.max needs a bounded height
            // and throws under the unbounded height of the scroll list).
            mainAxisSize: MainAxisSize.min,
            theme: TimelineThemeData(
              color: kcTitleTurquoise,
              nodePosition: 0.10,
              nodeItemOverlap: true,
              indicatorTheme: IndicatorThemeData(),
              connectorTheme: ConnectorThemeData(),
            ),
            builder: TimelineTileBuilder.connectedFromStyle(
              contentsAlign: ContentsAlign.basic,
              itemCount: projects.length,
              contentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 4),
                child: ProjectCardMobile(project: projects[index]),
              ),
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Text(
                  projects[index].startDate.monthYear,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              connectorStyleBuilder: (context, index) => ConnectorStyle.dashedLine,
              indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
            ),
          ),
          Space.height(4.h)!,
          const IconAnimation(
              icon: Icon(Icons.keyboard_double_arrow_down, size: 70, color: kcDevsiteTurquise))
        ],
      ),
    );
  }
}
