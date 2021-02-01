import 'package:get/get.dart';

import '../../data/repository.dart';
import '../../data/services/network_info.dart';
import '../../data/sources/dreamshape_api.dart';
import 'market.controller.dart';

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketController>(() => MarketController(repository: Get.find()));
    Get.lazyPut<Repository>(
        () => Repository(api: Get.find(), networkInfo: Get.find()));
    Get.lazyPut<DreamShapeApi>(() => DreamShapeApi());
    Get.lazyPut<NetworkInfo>(() => NetworkInfo(dcc: Get.find()));
  }
}
