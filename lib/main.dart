import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/theme/theme.dart';
import 'data/services/connection_checker.dart';
import 'data/sources/dreamshape_api.dart';
import 'data/sources/json_provider.dart';
import 'routes/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Rohmarkt());
}

/// + Rohmarkt

class Rohmarkt extends GetMaterialApp {
  Rohmarkt()
      : super(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          initialBinding: _InitialBinding(),
          initialRoute: Routes.market,
          getPages: Pages.routes,
        );
}

/// + Initial Binding

class _InitialBinding extends Bindings {
  @override
  void dependencies() {
    // + ConnectionChecker
    Get.lazyPut<ConnectionChecker>(
      () => ConnectionChecker(),
    );
    // + JsonProvider
    Get.lazyPut<JsonProvider>(
      () => JsonProvider(),
    );
    // + DreamShapeApi
    Get.lazyPut<DreamShapeApi>(
      () => DreamShapeApi(),
    );
  }
}
