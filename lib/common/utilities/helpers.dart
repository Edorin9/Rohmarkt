import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// + SnackBar

void showSnackbar({
  @required String message,
  SnackbarType type = SnackbarType.neutral,
}) {
  Get.rawSnackbar(
    backgroundColor: type.color,
    messageText: Text(message),
  );
}

enum SnackbarType { neutral, info, success, error, warning }

extension SnackbarTypeExt on SnackbarType {
  static const colors = {
    SnackbarType.neutral: Color(0xFF303030),
    SnackbarType.info: Color(0xff2196f3),
    SnackbarType.success: Color(0xff8bc34a),
    SnackbarType.error: Color(0xfff44336),
    SnackbarType.warning: Color(0xffffc107),
  };

  Color get color => colors[this];
}
