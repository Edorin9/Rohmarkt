import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';

import 'app/data/repository.dart';
import 'app/data/services/network_info.dart';
import 'app/data/sources/dreamshape_api.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Repository
    Get.lazyPut<Repository>(
      () => Repository(
        api: Get.find(),
        networkInfo: Get.find(),
      ),
    );
    // DreamShapeApi
    Get.lazyPut<DreamShapeApi>(
      () => DreamShapeApi(),
    );
    // NetworkInfo
    Get.lazyPut<NetworkInfo>(
      () => NetworkInfo(dataConnectionChecker: Get.find()),
    );
    // DataConnectionChecker
    Get.lazyPut<DataConnectionChecker>(
      () => DataConnectionChecker(),
    );
  }
}
