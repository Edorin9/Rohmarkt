import 'dart:convert';

import 'package:get/get_connect/connect.dart';

import '../../../core/error/exceptions.dart';
import '../models/market_item.dart';

class DreamShapeApi extends GetConnect {
  @override
  void onInit() => httpClient.baseUrl = 'https://api.dreamshape.at';

  Future<List<MarketItem>> getMarketItems() async {
    final response = await get('/dummy.php');
    if (response.isOk) {
      final List jsonList = json.decode(response.body.toString()) as List;
      return jsonList.map((item) => MarketItem.fromJson(item)).toList();
    } else {
      throw ServerException(response.statusText);
    }
  }
}
