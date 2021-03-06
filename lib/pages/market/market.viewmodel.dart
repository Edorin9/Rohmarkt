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
  bool get isLoading => _isLoading.value ?? false;
  // list
  final _items = <MarketItem>[].obs;
  List<MarketItem> get items => _items;

  // + Events

  void onItemClicked(MarketItem item) =>
      Get.toNamed(Routes.details, arguments: item);

  // + Overrides

  @override
  void onReady() {
    _getMarketItems();
    super.onReady();
  }

  // + Private

  Future<void> _getMarketItems() async {
    // start load -- call api
    _isLoading.value = true;
    final marketItemsResult = await _repository.getMarketItems();
    // result -> failure | success
    marketItemsResult.fold(
      (failure) => showSnackbar(
        message: failure.message,
        type: SnackbarType.error,
      ),
      (marketItems) => _items.addAll(marketItems),
    );
    // end load
    _isLoading.value = false;
  }
}
