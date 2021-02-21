import 'package:get/get.dart';

import '../../data/repositories/repository.dart';
import 'market.controller.dart';

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    // + MarketController
    Get.lazyPut<MarketController>(
      () => MarketController(repository: Get.find()),
    );
    // + Repository
    Get.lazyPut<Repository>(
      () => Repository(
        api: Get.find(),
        dummyProvider: Get.find(),
        networkInfo: Get.find(),
      ),
    );
  }
}
