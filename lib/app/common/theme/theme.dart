import 'package:flutter/material.dart';

import 'color_schemes.dart';
import 'text_themes.dart';

class AppTheme {
  static final ThemeData light = AppTheme._buildFrom(gLightColorScheme);
  static final ThemeData dark = AppTheme._buildFrom(gDarkColorScheme);

  /// + Build Theme from [ColorScheme]

  static ThemeData _buildFrom(ColorScheme colorScheme) {
    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: gLatoTextTheme,
    ).copyWith(
      appBarTheme: _appBarTheme(colorScheme.primary),
    );
  }

  // + AppBarTheme

  static AppBarTheme _appBarTheme(Color color) {
    return AppBarTheme(
      color: color,
      textTheme: gLatoTextTheme.copyWith(
        headline6: gLatoTextTheme.headline6.copyWith(color: Colors.white),
      ),
    );
  }
}
