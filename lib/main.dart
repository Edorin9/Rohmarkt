import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/pages.dart';
import 'binding.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colors.tealAccent),
      initialBinding: AppBinding(),
      initialRoute: Routes.market,
      getPages: Pages.routes,
    ),
  );
}
