import 'package:get/get.dart';

import 'market.controller.dart';

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    // MarketController
    Get.lazyPut<MarketController>(
      () => MarketController(repository: Get.find()),
    );
  }
}
