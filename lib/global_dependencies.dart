import 'package:get/get.dart';

import 'data/services/connection_checker.dart';
import 'data/sources/dreamshape_api.dart';
import 'data/sources/json_provider.dart';

class GlobalDependencies extends Bindings {
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
