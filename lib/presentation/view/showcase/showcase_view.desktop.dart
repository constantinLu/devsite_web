import 'package:devsite_web/application/extensions/date_extension.dart';
import 'package:devsite_web/presentation/common/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';

import '../../../application/model/project.dart';
import '../../common/messages.dart';
import '../../common/space.dart';
import '../../widget/animation/up_down_animation.dart';
import '../../widget/project_card.dart';

class ShowcaseDesktopView extends StatelessWidget {
  const ShowcaseDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = 310.h;
    var width = 20.w;
    return Container(
      height: height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      child: Column(
        children: [
          /// ROW 1 - 3 elements
          Center(
            child: Text(
              showcaseTitle,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Space.height(3.h)!,
          Expanded(
            child: FixedTimeline.tileBuilder(
              theme: TimelineThemeData(
                color: kcTitleTurquoise,
              ),
              builder: TimelineTileBuilder.connectedFromStyle(
                contentsAlign: ContentsAlign.alternating,
                itemCount: projects.length,
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: ProjectCard(project: projects[index], index: index),
                ),
                oppositeContentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    projects[index].startDate.monthYear,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                connectorStyleBuilder: (context, index) => ConnectorStyle.dashedLine,
                indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
              ),
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
