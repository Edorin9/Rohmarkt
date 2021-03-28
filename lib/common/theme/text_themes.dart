import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// + Text Theme

final TextTheme gLatoTextTheme = TextTheme(
  headline1: GoogleFonts.lato(
    fontSize: 101,
    fontWeight: gLightFontWeight,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.lato(
    fontSize: 63,
    fontWeight: gLightFontWeight,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.lato(
    fontSize: 50,
    fontWeight: gRegularFontWeight,
  ),
  headline4: GoogleFonts.lato(
    fontSize: 36,
    fontWeight: gRegularFontWeight,
    letterSpacing: 0.25,
  ),
  headline5: GoogleFonts.lato(
    fontSize: 25,
    fontWeight: gRegularFontWeight,
  ),
  headline6: GoogleFonts.lato(
    fontSize: 21,
    fontWeight: gBoldFontWeight,
    letterSpacing: 0.15,
  ),
  subtitle1: GoogleFonts.lato(
    fontSize: 17,
    fontWeight: gRegularFontWeight,
    letterSpacing: 0.15,
  ),
  subtitle2: GoogleFonts.lato(
    fontSize: 15,
    fontWeight: gMediumFontWeight,
    letterSpacing: 0.1,
  ),
  bodyText1: GoogleFonts.lato(
    fontSize: 17,
    fontWeight: gRegularFontWeight,
    letterSpacing: 0.5,
  ),
  bodyText2: GoogleFonts.lato(
    fontSize: 15,
    fontWeight: gRegularFontWeight,
    letterSpacing: 0.25,
  ),
  button: GoogleFonts.lato(
    fontSize: 15,
    fontWeight: gMediumFontWeight,
    letterSpacing: 1.25,
  ),
  caption: GoogleFonts.lato(
    fontSize: 13,
    fontWeight: gRegularFontWeight,
    letterSpacing: 0.4,
  ),
  overline: GoogleFonts.lato(
    fontSize: 10,
    fontWeight: gRegularFontWeight,
    letterSpacing: 1.5,
  ),
);

// + Font Weights

const gThinFontWeight = FontWeight.w100;
const gExtraLightFontWeight = FontWeight.w200;
const gLightFontWeight = FontWeight.w300;
const gRegularFontWeight = FontWeight.w400;
const gMediumFontWeight = FontWeight.w500;
const gSemiBoldFontWeight = FontWeight.w600;
const gBoldFontWeight = FontWeight.w700;
const gExtraBoldFontWeight = FontWeight.w800;
const gBlackFontWeight = FontWeight.w900;
