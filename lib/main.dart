import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'rohmarkt/routing/pages.dart';

Future<void> main() async {
  await _initialize();
  runApp(
    GetMaterialApp(
      initialRoute: Routes.main,
      getPages: Pages.routes,
    ),
  );
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<DataConnectionChecker>(DataConnectionChecker());
}
