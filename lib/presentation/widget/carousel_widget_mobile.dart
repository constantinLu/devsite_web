import 'package:carousel_slider/carousel_slider.dart';
import 'package:devsite_web/application/assets/app_assets.dart';
import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../common/color_picker.dart';
import 'animation/grey_scale.dart';

class CarouselMobileWidget extends StatefulWidget {
  const CarouselMobileWidget({super.key});

  @override
  State<CarouselMobileWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselMobileWidget> {
  final CarouselController _controller = CarouselController();
  static const tools = [
    AppAssets.azure,
    AppAssets.confluence,
    AppAssets.docker,
    AppAssets.flutter,
    AppAssets.git,
    AppAssets.gradle,
    AppAssets.gcp,
    AppAssets.intelliJ,
    AppAssets.java,
    AppAssets.jira,
    AppAssets.maven,
    AppAssets.mysql,
    AppAssets.postgresql,
    AppAssets.springboot,
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size(90.w, double.infinity)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _controller.previousPage();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: kcLightGrey,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: ConstrainedBox(
                  constraints: BoxConstraints.loose(Size(70.w, double.infinity)),
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: 10.h,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.easeInBack,
                      autoPlayAnimationDuration: const Duration(milliseconds: 200),
                      viewportFraction: 0.5,
                    ),
                    items: tools.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {},
                            child: Tooltip(
                              richMessage: TextSpan(
                                text: extractName(i),
                                style: const TextStyle(
                                  color: kcGreyDim,
                                  fontSize: 16.0,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.matrix(grayscaleMatrix),
                                child: SvgPicture.asset(
                                  i,
                                  fit: BoxFit.contain,
                                  width: 40.w,
                                  height: 14.h,
                                ),
                              ),
                            ).moveUpOnHover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _controller.nextPage();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                  color: kcLightGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showMobileTooltip(BuildContext context, message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 3), // Adjust the duration as needed
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

String extractName(String input) {
  final regex = RegExp(r'[^/]+(?=\.\w+$)|[^/]+(?=;$)');
  final match = regex.firstMatch(input);
  return match?.group(0) ?? '';
}
