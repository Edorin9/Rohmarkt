import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/mvvm/getx_viewmodel.dart';
import '../../common/utilities/helpers.dart';
import '../../data/models/market_item.dart';
import '../../data/repositories/repository.dart';
import '../../routes/pages.dart';

class MarketViewModel extends GetxViewModel {
  final Repository _repository;

  MarketViewModel({
    required Repository repository,
  }) : _repository = repository;

  // + Properties

  // loader
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  // list
  final _items = <MarketItem>[].obs;
  List<MarketItem> get items => _items;

  // + Triggers

  void marketItemClicked(MarketItem item) =>
      Get.toNamed(Routes.detail, arguments: item);

  // + Overrides

  @override
  void onReady() {
    _getMarketItems();
    super.onReady();
  }

  // + Private

  Future<void> _getMarketItems() async {
    // start load -- load items
    _isLoading.value = true;
    final marketItemsResult = await _repository.getMarketItems();
    // result -> failure | success
    marketItemsResult.fold(
      (failure) {
        showSnackbar(
          message: failure.message,
          status: Status.error,
          brightness: Brightness.dark,
          duration: 4.seconds,
        );
      },
      (marketItems) {
        _items.addAll(marketItems);
      },
    );
    // end load
    _isLoading.value = false;
  }
}
