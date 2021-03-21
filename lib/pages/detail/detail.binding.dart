import 'package:get/get.dart';

import 'detail.viewmodel.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    // + DetailsViewModel
    Get.lazyPut<DetailViewModel>(() => DetailViewModel());
  }
}
