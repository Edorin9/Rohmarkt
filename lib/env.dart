import 'package:flutter/foundation.dart';

enum Environment { debug, profile, release }

/// App's build environment
///
const Environment ENV_ = kDebugMode
    ? Environment.debug
    : kProfileMode
        ? Environment.profile
        : Environment.release;

/// Environment Extensions
///
extension EnvironmentExt on Environment {
  String get name => _envNames[this]!;
  String get baseUrl => _baseUrls[this]!;
}

extension StringEnvExt on String {
  /// Environmentalize
  ///
  /// Append environment eg: 'MY_STRING' -> 'MY_STRING_DEBUG'.
  /// Commonly used for storage keys to avoid access conflicts
  /// between environment builds when testing.
  ///
  String get envalize => '${this}_${ENV_.name}';
}

// + Constants

const _envNames = {
  Environment.debug: 'DEBUG',
  Environment.profile: 'PROFILE',
  Environment.release: 'RELEASE',
};

const _baseUrls = {
  Environment.debug: 'https://api.dreamshape.at',
  Environment.profile: 'https://api.dreamshape.at',
  Environment.release: 'https://api.dreamshape.at',
};
