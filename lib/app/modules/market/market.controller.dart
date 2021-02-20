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

  // + View-Model

  // loader
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  // list
  final _items = <MarketItem>[].obs;
  List<MarketItem> get items => _items;

  // + Triggers

  void onItemClicked(MarketItem item) =>
      Get.toNamed(Routes.details, arguments: item);

  // + Override Methods

  @override
  void onInit() {
    // load items
    _getMarketItems();
    super.onInit();
  }

  // + Private Methods

  Future<void> _getMarketItems() async {
    // start load -- call api
    _isLoading.value = true;
    final marketItemsResult = await _repository.getMarketItems();
    marketItemsResult.fold(
      // show error | add items
      (failure) => Get.snackbar('Error', failure.message),
      (marketItems) => _items.addAll(marketItems),
    );
    // stop load
    _isLoading.value = false;
    // ? try change theme
    // await Future.delayed(const Duration(seconds: 3));
    // Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
