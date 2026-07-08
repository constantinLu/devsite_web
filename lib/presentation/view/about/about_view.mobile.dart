import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:devsite_web/presentation/widget/carousel_widget_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seo/seo.dart';
import 'package:sizer/sizer.dart';

import '../../../application/assets/app_assets.dart';
import '../../../application/provider/theme_provider.dart';
import '../../common/color_picker.dart';
import '../../common/messages.dart';
import '../../common/space.dart';
import '../../common/style.dart';
import '../../widget/animation/animation_text.dart';
import '../../widget/animation/up_down_animation.dart';

class AboutMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return SizedBox(
      height: 120.h,
      width: 100.w,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Seo.image(
                src: provider.isDarkMode ? AppAssets.devsiteDark : AppAssets.devsiteLight,
                alt: "DEVSite software development",
                child: Image.asset(
                  provider.isDarkMode ? AppAssets.devsiteDark : AppAssets.devsiteLight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Space.height(2.h)!,
            Seo.text(
              text: aboutHello,
              child: Text(aboutHello, style: poppinsStyle(context, 30)),
            ),
            Space.height(1.h)!,
            Seo.text(
              text: welcomeTitle,
              style: TextTagStyle.h1,
              child: Text(
                welcomeTitle,
                style: montserratStyle(context, 25),
              ),
            ),
            Space.height(1.h)!,
            Expanded(
              child: AnimatedTextKit(
                isRepeatingAnimation: true,
                repeatForever: true,
                animatedTexts: desktopList,
              ),
            ),
            Space.height(4.h)!,
            Seo.text(
              text: miniDescription,
              child: Text(
                miniDescription,
                style: robotoStyle(context),
              ),
            ),
            Space.height(6.h)!,
            CarouselMobileWidget(),
            Space.height(1.h)!,
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Center(
                  child: const IconAnimation(
                      icon:
                          Icon(Icons.keyboard_double_arrow_down, size: 50, color: kcDevsiteTurquise)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
