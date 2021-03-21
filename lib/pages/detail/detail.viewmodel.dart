import 'package:get/get.dart';

import '../../common/mvvm/getx_viewmodel.dart';
import '../../data/models/market_item.dart';

class DetailViewModel extends GetxViewModel {
  // + Properties

  final marketItem = Get.arguments as MarketItem;
}
