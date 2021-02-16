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

  // ! View-Model

  // loading state
  final isLoading = false.obs;
  // list state
  final items = <MarketItem>[].obs;

  // ! Override Methods

  @override
  void onInit() {
    // load items
    _getMarketItems();
    super.onInit();
  }

  // ! Public Methods

  void onItemClicked(MarketItem item) =>
      Get.toNamed(Routes.details, arguments: item);

  // ! Private Methods

  Future<void> _getMarketItems() async {
    // start load
    isLoading.value = true;
    // call api
    final marketItemsResult = await _repository.getMarketItems();
    marketItemsResult.fold(
      // show error
      (failure) => Get.snackbar('Error', failure.message),
      // add items
      (marketItems) => items.addAll(marketItems),
    );
    // stop load
    isLoading.value = false;
  }
}
