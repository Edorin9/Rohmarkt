import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// + SnackBar

void showSnackbar({
  @required String message,
  SnackbarType type,
}) {
  Get.rawSnackbar(
    backgroundColor: type.color,
    messageText: Text(message),
  );
}

enum SnackbarType { neutral, info, success, error, warning }

extension SnackbarTypeExt on SnackbarType {
  Color get color {
    switch (this) {
      case SnackbarType.info:
        return const Color(0xff8bc34a);
      case SnackbarType.success:
        return const Color(0xff2196f3);
      case SnackbarType.error:
        return const Color(0xfff44336);
      case SnackbarType.warning:
        return const Color(0xffffc107);
      default:
        return const Color(0xFF303030);
    }
  }
}
