import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/pages.dart';
import 'binding.dart';

Future<void> main() async {
  runApp(
    GetMaterialApp(
      theme: ThemeData(accentColor: Colors.tealAccent),
      initialBinding: AppBinding(),
      initialRoute: Routes.market,
      getPages: Pages.routes,
    ),
  );
}
