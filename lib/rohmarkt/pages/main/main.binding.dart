import 'package:get/get.dart';

import '../../../core/util/network_info.dart';
import '../../data/repository.dart';
import '../../data/sources/dreamshape_api.dart';
import 'main.controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(repository: Get.find()));
    Get.lazyPut<Repository>(
        () => Repository(api: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<DreamShapeApi>(() => DreamShapeApi());
    Get.lazyPut<NetworkInfo>(() => NetworkInfo(dcc: Get.find()));
  }
}
