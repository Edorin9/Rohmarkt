import 'package:flutter/material.dart';

// + Colors

const gDarkGreen = Colors.teal;
const gLightGreen = Colors.tealAccent;

// + Color Schemes

const ColorScheme gLightColorScheme = ColorScheme.light(
  primary: gLightGreen,
  primaryVariant: gLightGreen,
  secondary: gDarkGreen,
  secondaryVariant: gDarkGreen,
  background: Color(0xfffafafa),
);

const ColorScheme gDarkColorScheme = ColorScheme.dark(
  primary: gDarkGreen,
  primaryVariant: gDarkGreen,
  secondary: gLightGreen,
  secondaryVariant: gLightGreen,
);
