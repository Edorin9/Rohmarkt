import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// + SnackBar

void showSnackbar({
  required String message,
  Status status = Status.neutral,
  Brightness brightness = Brightness.light,
  Duration duration = const Duration(seconds: 3),
}) {
  Get.rawSnackbar(
    messageText: Text(
      message,
      style: const TextStyle(height: 1.44),
    ),
    leftBarIndicatorColor:
        (brightness == Brightness.dark) ? status.color : null,
    backgroundColor:
        (brightness == Brightness.light) ? status.color : Status.neutral.color,
    duration: duration,
  );
}

enum Status { neutral, info, success, error, warning }

extension StatusExt on Status {
  static const colors = {
    Status.neutral: Color(0xFF303030),
    Status.info: Color(0xFF1976D2),
    Status.success: Color(0xFF689F38),
    Status.error: Color(0xFFD32F2F),
    Status.warning: Color(0xFFFFA000),
  };

  Color get color => colors[this] ?? const Color(0xFF303030);
}
