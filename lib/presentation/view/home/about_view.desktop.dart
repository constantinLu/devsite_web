import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:devsite_web/application/assets/app_assets.dart';
import 'package:devsite_web/presentation/common/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../application/provider/theme_provider.dart';
import '../../common/color_picker.dart';
import '../../common/messages.dart';
import '../../common/space.dart';
import '../../widget/animation/animation_text.dart';
import '../../widget/animation/up_down_animation.dart';
import '../../widget/carousel_widget.dart';

class AboutDesktopView extends StatelessWidget {
  const AboutDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);

    return SizedBox(
      height: 90.h,
      width: 25.w,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 2.h),
            child: Row(
              /// 1 - LEFT TEXT SIDE
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 2.h, bottom: 12.h),
                  width: 50.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(aboutHello, style: poppinsStyle(context, 30)),
                        ],
                      ),
                      Space.height(0.3.w)!,
                      Text(
                        //TODO: Add box decoration to text to match the retro style
                        welcomeTitle,
                        style: montserratStyle(context, 25),
                      ),
                      Space.height(0.5.h)!,
                      AnimatedTextKit(
                        isRepeatingAnimation: true,
                        repeatForever: true,
                        animatedTexts: desktopList,
                      ),
                      Space.height(4.h)!,
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Text(
                          miniDescription,
                          style: robotoStyle(context),
                        ),
                      ),
                    ],
                  ),
                ),

                /// 1 - GIF LOGO
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        provider.isDarkMode ? AppAssets.devsiteDark : AppAssets.devsiteLight,
                        fit: BoxFit.contain,
                      ),
                      Space.height(15.h)!,
                    ],
                  ),
                ),
                //const ZoomAnimations(),
              ],
            ),
          ),
          Space.height(12.h)!,
          const CarouselWidget(),
          Space.height(4.h)!,
          const IconAnimation(
              icon: Icon(Icons.keyboard_double_arrow_down, size: 70, color: kcDevsiteTurquise))
        ],
      ),
    );
  }
}
