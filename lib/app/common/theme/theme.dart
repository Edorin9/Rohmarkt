import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const _darkContentColor = Colors.black;
  static const _lightContentColor = Colors.white;

  static const Color _darkFocusColor = Colors.black12;
  static const Color _lightFocusColor = Colors.white12;

  static final ThemeData light = buildTheme(lightColorScheme, _darkFocusColor);
  static final ThemeData dark = buildTheme(darkColorScheme, _lightFocusColor);

  // ! Theme Builder

  static ThemeData buildTheme(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      accentColor: colorScheme.primary,
      focusColor: focusColor,
    );
  }

  // ! Color Schemes

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFB93C5D),
    onPrimary: _darkContentColor,
    primaryVariant: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    onSecondary: Color(0xFF322942),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    onBackground: Colors.white,
    surface: Color(0xFFFAFBFB),
    onSurface: Color(0xFF241E30),
    error: _darkContentColor,
    onError: _lightContentColor,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFF8383),
    onPrimary: _darkContentColor,
    primaryVariant: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    onSecondary: _lightContentColor,
    secondaryVariant: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    onBackground: Color(0x0DFFFFFF), // White with 0.05 opacity
    surface: Color(0xFF1F1929),
    onSurface: _lightContentColor,
    error: _darkContentColor,
    onError: _lightContentColor,
  );

  // ! Text Theme

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.lato(
      fontSize: 101,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headline2: GoogleFonts.lato(
      fontSize: 63,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headline3: GoogleFonts.lato(
      fontSize: 50,
      fontWeight: FontWeight.w400,
    ),
    headline4: GoogleFonts.lato(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: GoogleFonts.lato(
      fontSize: 25,
      fontWeight: FontWeight.w400,
    ),
    headline6: GoogleFonts.lato(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.lato(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: GoogleFonts.lato(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: GoogleFonts.lato(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: GoogleFonts.lato(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}
