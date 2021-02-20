import 'package:flutter/material.dart';

import 'color_schemes.dart';
import 'text_themes.dart';

class AppTheme {
  static final ThemeData light = AppTheme.build(gLightColorScheme);
  static final ThemeData dark = AppTheme.build(gDarkColorScheme);

  /// + Build Theme from [ColorScheme]

  static ThemeData build(ColorScheme colorScheme) {
    final appBarH6Style =
        gLatoTextTheme.headline6.copyWith(color: Colors.white);
    final appBarTextTheme = gLatoTextTheme.copyWith(headline6: appBarH6Style);
    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: gLatoTextTheme,
    ).copyWith(
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        textTheme: appBarTextTheme,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
    );
  }
}
