import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/common/theme/theme.dart';
import 'app/data/services/network_info.dart';
import 'app/data/sources/dreamshape_api.dart';
import 'app/data/sources/dummy_json_provider.dart';
import 'app/routes/pages.dart';

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
    // + DreamShapeApi
    Get.lazyPut<DreamShapeApi>(
      () => DreamShapeApi(),
    );
    // + NetworkInfo
    Get.lazyPut<NetworkInfo>(
      () => NetworkInfo(dataConnectionChecker: Get.find()),
    );
    // + DataConnectionChecker
    Get.lazyPut<DataConnectionChecker>(
      () => DataConnectionChecker(),
    );
    // + DummyJsonProvider
    Get.lazyPut<DummyJsonProvider>(
      () => DummyJsonProvider(),
    );
  }
}
