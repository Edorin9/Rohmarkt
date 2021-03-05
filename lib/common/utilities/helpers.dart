import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rohmarkt/common/utilities/dimensions.dart';

// + SnackBar

void showSnackbar({
  @required String message,
  SnackbarType type = SnackbarType.neutral,
  Duration duration = const Duration(seconds: 3),
}) {
  Get.rawSnackbar(
    padding: gInsets0,
    messageText: Column(
      children: [
        if (type != SnackbarType.neutral)
          Container(
            color: type.color,
            width: double.infinity,
            height: 4,
          )
        else
          const SizedBox(),
        Padding(
          padding: gInsets20,
          child: Text(message),
        ),
      ],
    ),
    duration: duration,
  );
}

void showBrightSnackbar({
  @required String message,
  SnackbarType type = SnackbarType.neutral,
  Duration duration = const Duration(seconds: 3),
}) {
  Get.rawSnackbar(
    backgroundColor: type.color,
    messageText: Text(message),
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
