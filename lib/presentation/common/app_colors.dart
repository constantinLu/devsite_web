import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xFF9600FF);
const Color kcPrimaryColorDark = Color(0xFF300151);
const Color kcBlackCarbon = Color(0xff252525);
const Color kcDarkGreyColor = Color(0xFF121212);
const Color kcDarkGreyShimmerEndColor = Color(0xFF1C1C1C);
const Color kcMediumGrey = Color(0xFF222222);
const Color kcLightGrey = Color(0xff989898);
const Color kcVeryLightGrey = Color(0xFFE3E3E3);

const Color kcBackgroundColor = kcBlackCarbon;

const Color kcTitleGrey = Color(0xff949494);
const Color kcTitleTurquoise = Color(0xff03BFB5);

const List<Color> kgTitle = [kcTitleGradientLeft, kcTitleGradientRight];
const Color kcTitleGradientLeft = kcTitleTurquoise;
const Color kcTitleGradientRight = kcTitleGrey;


primaryColor(context) =>
    Theme
        .of(context)
        .primaryColor;

//blacks
const blackFull = Color.fromRGBO(0, 0, 0, 1);
const blackErie = Color.fromRGBO(37, 37, 37, 1);
const blackJet = Color.fromRGBO(51, 51, 51, 1);
const blackCard = Color.fromRGBO(13, 13, 13, 1);
const blackCard2 = Color.fromRGBO(16, 16, 16, 1);

//whites
const whiteFull = Color.fromRGBO(255, 255, 255, 1);
const whiteSnow = Color.fromRGBO(248, 248, 247, 1);
const kcWhiteCultured = Color.fromRGBO(221, 221, 216, 1);


//greys
const greyPlatinum = Color.fromRGBO(228, 228, 228, 1);
const greySpanish = Color.fromRGBO(148, 148, 148, 1);
const greyDim = Color.fromRGBO(106, 106, 106, 1);


//testing opacity //HEXA
// 100% — FF
// 95% — F2
// 90% — E6
// 85% — D9
// 80% — CC
// 75% — BF
// 70% — B3
// 65% — A6
// 60% — 99
// 55% — 8C
// 50% — 80
// 45% — 73
// 40% — 66
// 35% — 59
// 30% — 4D
// 25% — 40
// 20% — 33
// 15% — 26
// 10% — 1A
// 5% — 0D
// 0% — 00
const Color greySpanishHexa = Color(0xCC949494);