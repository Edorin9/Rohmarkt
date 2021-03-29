import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:rohmarkt/env.dart';

import '../../common/errors/exceptions.dart';
import '../models/market_item.dart';

class DreamShapeApi extends GetConnect {
  @override
  void onInit() => httpClient.baseUrl = ENV_.baseUrl;

  Future<List<MarketItem>?> getMarketItems() async {
    final response = await get<List<MarketItem>>(
      '/dummy.php',
      decoder: (body) => (jsonDecode(body.toString()) as List)
          .map((item) => MarketItem.fromJson(item))
          .toList(),
    );
    return (response.isOk)
        ? response.body
        : throw HttpException(response.statusCode, response.statusText);
  }
}
