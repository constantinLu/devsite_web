import 'package:devsite_web/presentation/view/services/service_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../application/assets/app_assets.dart';
import '../../../application/model/tags.dart';
import '../../common/color_picker.dart';
import '../../common/messages.dart';
import '../../common/space.dart';
import '../../common/style.dart';
import '../../widget/animation/up_down_animation.dart';
import '../../widget/service_card_widget.dart';

/// Dedicated tablet layout: the service cards stacked, centered and capped to a
/// comfortable tablet width so they don't stretch across the whole screen.
class ServiceTabletView extends StatelessWidget {
  const ServiceTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesMap = ServiceView.servicesMap;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(servicesTitle, style: poppinsStyle(context, 40, FontWeight.w400)),
              Space.height(2.h)!,
              ServiceCard(
                name: servicesMap.keys.where((key) => key == "CUSTOM SOFTWARE").first,
                description: servicesMap["CUSTOM SOFTWARE"]!,
                image: AppAssets.customCard,
                tags: [
                  TagManager.getTag("spring"),
                  TagManager.getTag("java"),
                  TagManager.getTag("git")
                ],
              ),
              ServiceCard(
                name:
                    servicesMap.keys.where((key) => key == "API DEVELOPMENT AND INTEGRATION").first,
                description: servicesMap["API DEVELOPMENT AND INTEGRATION"]!,
                image: AppAssets.apiCard,
                tags: [
                  TagManager.getTag("teamcity"),
                  TagManager.getTag("kafka"),
                  TagManager.getTag("rest-api"),
                ],
              ),
              ServiceCard(
                name: servicesMap.keys.where((key) => key == "BACKEND REFACTORING").first,
                description: servicesMap["BACKEND REFACTORING"]!,
                image: AppAssets.refactorCard,
                tags: [
                  TagManager.getTag("integration-test"),
                  TagManager.getTag("unit-test"),
                ],
              ),
              ServiceCard(
                name: servicesMap.keys.where((key) => key == "MOBILE APP BACKEND DEVELOPMENT").first,
                description: servicesMap["MOBILE APP BACKEND DEVELOPMENT"]!,
                image: AppAssets.mobileCard,
                tags: [
                  TagManager.getTag("dart"),
                  TagManager.getTag("gradle"),
                  TagManager.getTag("flutter"),
                  TagManager.getTag("java"),
                ],
              ),
              ServiceCard(
                name: servicesMap.keys.where((key) => key == "WEB APPLICATIONS").first,
                description: servicesMap["WEB APPLICATIONS"]!,
                image: AppAssets.webCard,
                tags: [
                  TagManager.getTag("java"),
                  TagManager.getTag("flutter"),
                  TagManager.getTag("spring"),
                  TagManager.getTag("maven")
                ],
              ),
              Space.height(4.h)!,
              const IconAnimation(
                  icon: Icon(Icons.keyboard_double_arrow_down, size: 70, color: kcDevsiteTurquise))
            ],
          ),
        ),
      ),
    );
  }
}
