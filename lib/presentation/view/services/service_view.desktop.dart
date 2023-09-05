import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:devsite_web/application/model/tags.dart';
import 'package:devsite_web/presentation/common/color_picker.dart';
import 'package:devsite_web/presentation/widget/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../application/assets/app_assets.dart';
import '../../common/messages.dart';
import '../../common/space.dart';
import '../../common/style.dart';
import '../../widget/animation/up_down_animation.dart';

class ServiceDesktopView extends StatelessWidget {
  const ServiceDesktopView({
    super.key,
  });

  static const servicesMap = {
    "CUSTOM SOFTWARE": "Looking for a backend team to implement your business idea?"
        " Contact us for a bespoke back-end infrastructure. Upgrade, enhance, "
        "or migrate your back-ends at speed and affordable costs.",
    "API DEVELOPMENT AND INTEGRATION": "We can build a custom API to amplify your existing software "
        "or connect it with third-party services. Integrate your interface with other apps, devices, "
        "and business systems seamlessly and hassle-free.",
    "BACKEND REFACTORING": "Failing to get optimum app performance? Devsite Software "
        "can rehaul the entire solution infrastructure leaving the front end intact. Rebuild existing "
        "systems to reduce technical costs and enhance the code.",
    "MOBILE APP BACKEND DEVELOPMENT": "Devsite assists businesses in "
        "building robust mobile back-end apps across multiple devices and platforms. We create "
        "fault-tolerant back ends for native and cross-platform applications using the latest "
        "technology trends.",
    "WEB APPLICATIONS": "Leverage our backend web development services to ensure smooth and high "
        "website performance. Whether it’s a large-scale system, web portal, or IoT infrastructures, "
        "our team of web developers will deliver high-load performance systems with enhanced stability."
  };

  String getValue(searchKey) => servicesMap.keys.firstWhere((key) => servicesMap[key] == searchKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 90.h,
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// ROW 1 - 3 elements
          Text(servicesTitle, style: poppinsStyle(context, 32, FontWeight.w400)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              name: servicesMap.keys.where((key) => key == "API DEVELOPMENT AND INTEGRATION").first,
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
                TagManager.getTag("integration-testing"),
                TagManager.getTag("unit-testing"),
              ],
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ServiceCard(
                name:
                    servicesMap.keys.where((key) => key == "MOBILE APP BACKEND DEVELOPMENT").first,
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
            ],
          ),
          Space.height(4.h)!,
          const IconAnimation(
              icon: Icon(Icons.keyboard_double_arrow_down, size: 70, color: kcDevsiteTurquise))
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final List<Tag>? tags;

  const ServiceCard(
      {super.key, required this.name, required this.description, required this.image, this.tags});

  @override
  Widget build(BuildContext context) {
    var backgroundColor = tags?.first.backgroundColor?.withOpacity(0.8);
    return SizedBox(
      width: 22.w,
      height: 50.h,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Card(
          shadowColor: kcGreyPlatinum,
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(color: backgroundColor ?? Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
                      child: SvgPicture.asset(
                        image,
                        fit: BoxFit.scaleDown,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                  ),
                ],
              ),
              Space.height(3.h)!,
              Padding(
                padding: const EdgeInsets.all(20).copyWith(bottom: 0),
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16).copyWith(bottom: 10),
                child: Text(
                  description,
                  style: const TextStyle(
                      fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Wrap(
                        runAlignment: WrapAlignment.start,
                        children: [
                          ...?tags?.map(
                            (tag) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                              child: TagWidget(tag, TagSize.M),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ).moveUpOnHover;
  }
}
