import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// + SnackBar

void showSnackbar({
  required String message,
  SnackbarType type = SnackbarType.neutral,
  Brightness brightness = Brightness.light,
  Duration duration = const Duration(seconds: 3),
}) {
  Get.rawSnackbar(
    message: message,
    leftBarIndicatorColor: (brightness == Brightness.dark) ? type.color : null,
    backgroundColor: (brightness == Brightness.light)
        ? type.color
        : SnackbarType.neutral.color,
    duration: duration,
  );
}

enum SnackbarType { neutral, info, success, error, warning }

extension SnackbarTypeExt on SnackbarType {
  static const colors = {
    SnackbarType.neutral: Color(0xFF303030),
    SnackbarType.info: Color(0xFF1976D2),
    SnackbarType.success: Color(0xFF689F38),
    SnackbarType.error: Color(0xFFD32F2F),
    SnackbarType.warning: Color(0xFFFFA000),
  };

  Color get color => colors[this] ?? const Color(0xFF303030);
}
