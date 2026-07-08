import 'package:devsite_web/presentation/widget/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_picker.dart';

robotoStyle(BuildContext context, [double? size = 16]) => TextStyle(
      fontSize: size,
      fontFamily: GoogleFonts.robotoMono().fontFamily,
      fontWeight: FontWeight.w100,
      color: Theme.of(context).textColor.withOpacity(0.6),
    );

montserratStyle(BuildContext context, [double? size = 16, FontWeight weight = FontWeight.w200]) =>
    GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: weight,
      color: Theme.of(context).textColor,
    );

montserratStyleWithColor(BuildContext context, [double? size = 16, Color? color = kcWhiteCultured, FontWeight weight = FontWeight.w200]) =>
    GoogleFonts.montserrat(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );


poppinsStyle(BuildContext context,
        [double? size = 16, FontWeight weight = FontWeight.w700, Color? color]) =>
    GoogleFonts.poppins(fontSize: size, fontWeight: weight, color: color);
