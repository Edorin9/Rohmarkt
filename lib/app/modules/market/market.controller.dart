import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../data/models/market_item.dart';
import '../../data/repository.dart';
import '../../routes/pages.dart';

class MarketController extends GetxController {
  final Repository _repository;

  MarketController({
    @required Repository repository,
  }) : _repository = repository;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final items = <MarketItem>[].obs;

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
        isLoading = false;
      },
    );
  }
}
