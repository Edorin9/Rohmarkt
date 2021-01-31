import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../data/models/market_item.dart';
import '../../data/repository.dart';
import '../../routes/pages.dart';

class MainController extends GetxController {
  final Repository _repository;

  MainController({
    @required Repository repository,
  }) : _repository = repository;

  static MainController i = Get.find<MainController>();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final List<MarketItem> items = [];

  @override
  void onInit() {
    _getMarketItems();
    super.onInit();
  }

  void onItemClicked(MarketItem item) =>
      Get.toNamed(Routes.details, arguments: item);

  Future<void> _getMarketItems() async {
    isLoading = true;
    (await _repository.getMarketItems()).fold(
      (failure) {
        Get.snackbar('Error', failure.message);
        isLoading = false;
      },
      (marketItems) {
        items.addAll(marketItems);
        update();
        isLoading = false;
      },
    );
  }
}
