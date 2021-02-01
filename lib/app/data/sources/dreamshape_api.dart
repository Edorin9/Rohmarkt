import 'dart:convert';

import 'package:get/get_connect/connect.dart';

import '../../common/errors/exceptions.dart';
import '../models/market_item.dart';

class DreamShapeApi extends GetConnect {
  @override
  void onInit() => httpClient.baseUrl = 'https://api.dreamshape.at';

  Future<List<MarketItem>> getMarketItems() async {
    final response = await get('/dummy.php');
    if (response.isOk) {
      return response.bodyString.toList();
    } else {
      throw ServerException(
        'Error Code ${response.statusCode}: ${response.statusText}',
      );
    }
  }
}

extension _MarketItemListParse on String {
  List<MarketItem> toList() {
    final jsonList = jsonDecode(this) as List;
    return jsonList.map((item) => MarketItem.fromJson(item)).toList();
  }
}
