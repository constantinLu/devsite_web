import 'package:carousel_slider/carousel_slider.dart';
import 'package:devsite_web/application/assets/app_assets.dart';
import 'package:devsite_web/application/extensions/hover_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../common/color_picker.dart';
import 'animation/grey_scale.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
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

    return SizedBox(
      width: 75.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
                width: 70.w,
                child: CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 10.h,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(milliseconds: 200),
                    viewportFraction: 0.1,
                  ),
                  items: tools.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0),
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
                                width: 32.w,
                                height: 8.h,
                              ),
                            ),
                          ).moveUpOnHover,
                        );
                      },
                    );
                  }).toList(),
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

String extractName(String input) {
  final regex = RegExp(r'[^/]+(?=\.\w+$)|[^/]+(?=;$)');
  final match = regex.firstMatch(input);
  return match?.group(0) ?? '';
}
