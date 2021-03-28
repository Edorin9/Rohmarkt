import 'package:get/get.dart';

import 'data/services/connection_checker.dart';
import 'data/sources/dreamshape_api.dart';
import 'data/sources/json_provider.dart';

class GlobalDependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionChecker>(
      () => ConnectionChecker(), // ConnectionChecker
    );
    Get.lazyPut<JsonProvider>(
      () => JsonProvider(), // JsonProvider
    );
    Get.lazyPut<DreamShapeApi>(
      () => DreamShapeApi(), // DreamShapeApi
    );
  }
}
