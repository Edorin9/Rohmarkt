import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rohmarkt/app/common/theme/theme.dart';

import 'app/routes/pages.dart';
import 'binding.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialBinding: AppBinding(),
      initialRoute: Routes.market,
      getPages: Pages.routes,
    ),
  );
}
