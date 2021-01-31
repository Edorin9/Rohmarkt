import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/pages.dart';

Future<void> main() async {
  await _initialize();
  runApp(
    GetMaterialApp(
      theme: ThemeData(accentColor: Colors.tealAccent),
      initialRoute: Routes.market,
      getPages: Pages.routes,
    ),
  );
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<DataConnectionChecker>(DataConnectionChecker());
}
