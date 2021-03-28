import 'package:get/get.dart';

import 'detail.viewmodel.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailViewModel>(
      () => DetailViewModel(), // DetailViewModel
    );
  }
}
