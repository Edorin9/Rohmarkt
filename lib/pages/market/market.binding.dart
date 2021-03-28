import 'package:get/get.dart';

import '../../data/repositories/repository.dart';
import 'market.viewmodel.dart';

class MarketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketViewModel>(
      () => MarketViewModel(
        repository: Get.find(), // MarketViewModel
      ),
    );
    Get.lazyPut<Repository>(
      () => Repository(
        api: Get.find(), // Repository
        dummyProvider: Get.find(),
        connectionChecker: Get.find(),
      ),
    );
  }
}
