import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/common/theme/theme.dart';
import 'app/data/repository.dart';
import 'app/data/services/network_info.dart';
import 'app/data/sources/dreamshape_api.dart';
import 'app/data/sources/dummy_json_provider.dart';
import 'app/routes/pages.dart';

void main() => runApp(App());

/// + App
class App extends GetMaterialApp {
  @override
  bool get debugShowCheckedModeBanner => false;

  @override
  ThemeMode get themeMode => ThemeMode.light;

  @override
  ThemeData get theme => AppTheme.light;

  @override
  ThemeData get darkTheme => AppTheme.dark;

  @override
  Bindings get initialBinding => InitialBinding();

  @override
  String get initialRoute => Routes.market;

  @override
  List<GetPage> get getPages => Pages.routes;
}

/// + Initial Binding
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // + Repository
    Get.lazyPut<Repository>(
      () => Repository(
        api: Get.find(),
        dummyProvider: Get.find(),
        networkInfo: Get.find(),
      ),
    );
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
