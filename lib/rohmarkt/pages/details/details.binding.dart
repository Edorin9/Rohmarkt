import 'package:get/get.dart';

import 'details.controller.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
