import 'package:animated_text_kit/animated_text_kit.dart';

import '../../common/app_typography.dart';
import '../../common/messages.dart';

List<TyperAnimatedText> desktopList = [
  TyperAnimatedText(animationBackend,
      speed: const Duration(milliseconds: 50), textStyle: AppText.h2!.copyWith(fontSize: 32)),
  TyperAnimatedText(animationWeb,
      speed: const Duration(milliseconds: 50), textStyle: AppText.h2!.copyWith(fontSize: 32)),
  TyperAnimatedText(animationMobile,
      speed: const Duration(milliseconds: 50), textStyle: AppText.h2!.copyWith(fontSize: 32))
];

List<TyperAnimatedText> tabList = [
  TyperAnimatedText(animationBackend,
      speed: const Duration(milliseconds: 50), textStyle: AppText.h2!.copyWith(fontSize: 20)),
  TyperAnimatedText(animationWeb,
      speed: const Duration(milliseconds: 50), textStyle: AppText.h2!.copyWith(fontSize: 20)),
  TyperAnimatedText(animationMobile,
      speed: const Duration(milliseconds: 50), textStyle: AppText.h2!.copyWith(fontSize: 20))
];
List<TyperAnimatedText> mobileList = [
  TyperAnimatedText(animationBackend,
      speed: const Duration(milliseconds: 50), textStyle: AppText.h2!.copyWith(fontSize: 16)),
  TyperAnimatedText(animationWeb,
      speed: const Duration(milliseconds: 50), textStyle: AppText.h2!.copyWith(fontSize: 16)),
  TyperAnimatedText(animationMobile,
      speed: const Duration(milliseconds: 50), textStyle: AppText.h2!.copyWith(fontSize: 16))
];
