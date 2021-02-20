import 'package:flutter/material.dart';

// + Colors

const gPrimaryGreen = Colors.teal;
const gSecondaryGreen = Colors.tealAccent;

// + Color Schemes

const ColorScheme gLightColorScheme = ColorScheme.light(
  primary: gPrimaryGreen,
  primaryVariant: gSecondaryGreen,
  secondary: gSecondaryGreen,
  secondaryVariant: gSecondaryGreen,
  background: Color(0xfffafafa),
);

const ColorScheme gDarkColorScheme = ColorScheme.dark(
  primary: gPrimaryGreen,
  primaryVariant: gPrimaryGreen,
  secondary: gSecondaryGreen,
  secondaryVariant: gSecondaryGreen,
);
