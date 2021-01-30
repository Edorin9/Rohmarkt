import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../data/models/market_item.dart';
import '../../data/repository.dart';
import '../../routing/pages.dart';

class MainController extends GetxController {
  final Repository repository;

  MainController({@required this.repository});
  static MainController i = Get.find<MainController>();

  RxBool isLoading = false.obs;
  final List<MarketItem> items = [];

  @override
  void onInit() {
    _getMarketItems();
    super.onInit();
  }

  void onItemClicked(MarketItem item) =>
      Get.toNamed(Routes.details, arguments: item);

  Future<void> _getMarketItems() async {
    isLoading.value = true;
    (await repository.getMarketItems()).fold(
      (failure) {
        Get.snackbar('Error', failure.errorMessage);
        isLoading.value = false;
      },
      (marketItems) {
        items.addAll(marketItems);
        update();
        isLoading.value = false;
      },
    );
  }
}
