import 'package:get/get.dart';

import '../../data/repositories/repository.dart';
import 'market.viewmodel.dart';

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    // + MarketViewModel
    Get.lazyPut<MarketViewModel>(
      () => MarketViewModel(repository: Get.find()),
    );
    // + Repository
    Get.lazyPut<Repository>(
      () => Repository(
        api: Get.find(),
        dummyProvider: Get.find(),
        connectionChecker: Get.find(),
      ),
    );
  }
}
