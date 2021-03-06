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
      appBarTheme: _appBarTheme(colorScheme),
    );
  }

  // + AppBarTheme

  static AppBarTheme _appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      brightness: colorScheme.brightness,
      color: colorScheme.primary,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: gLatoTextTheme.copyWith(
        headline6: gLatoTextTheme.headline6?.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
    );
  }
}
