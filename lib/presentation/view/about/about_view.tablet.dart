import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:devsite_web/application/assets/app_assets.dart';
import 'package:devsite_web/presentation/common/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seo/seo.dart';
import 'package:sizer/sizer.dart';

import '../../../application/provider/theme_provider.dart';
import '../../common/color_picker.dart';
import '../../common/messages.dart';
import '../../common/space.dart';
import '../../widget/animation/animation_text.dart';
import '../../widget/animation/up_down_animation.dart';
import '../../widget/carousel_widget_mobile.dart';

/// Dedicated tablet layout: a centered, single-column hero capped to a
/// comfortable width, sized between the phone and desktop layouts.
class AboutTabletView extends StatelessWidget {
  const AboutTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24.h,
                  child: Seo.image(
                    src: provider.isDarkMode ? AppAssets.devsiteDark : AppAssets.devsiteLight,
                    alt: "DEVSite software development",
                    child: Image.asset(
                      provider.isDarkMode ? AppAssets.devsiteDark : AppAssets.devsiteLight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Space.height(3.h)!,
                Seo.text(
                  text: aboutHello,
                  child: Text(aboutHello, style: poppinsStyle(context, 34)),
                ),
                Space.height(1.h)!,
                Seo.text(
                  text: welcomeTitle,
                  style: TextTagStyle.h1,
                  child: Text(
                    welcomeTitle,
                    textAlign: TextAlign.center,
                    style: montserratStyle(context, 26),
                  ),
                ),
                Space.height(2.h)!,
                SizedBox(
                  height: 6.h,
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: tabList,
                  ),
                ),
                Space.height(3.h)!,
                Seo.text(
                  text: miniDescription,
                  child: Text(
                    miniDescription,
                    textAlign: TextAlign.center,
                    style: robotoStyle(context),
                  ),
                ),
                Space.height(5.h)!,
                const CarouselMobileWidget(),
                Space.height(4.h)!,
                const IconAnimation(
                    icon: Icon(Icons.keyboard_double_arrow_down, size: 60, color: kcDevsiteTurquise)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
