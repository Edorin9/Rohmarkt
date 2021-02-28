import 'package:get/get.dart';

import 'details.viewmodel.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    // + DetailsViewModel
    Get.lazyPut<DetailsViewModel>(() => DetailsViewModel());
  }
}
