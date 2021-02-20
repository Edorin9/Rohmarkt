import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rohmarkt/app/data/models/market_item.dart';

class DummyJsonProvider {
  Future<List<MarketItem>> getMarketItems() async {
    final jsonMap = await _parseJsonFromAsset('dummy_market_items.json');
    return (jsonMap as List).map((e) => MarketItem.fromJson(e)).toList();
  }

  // + Private Methods

  Future<dynamic> _parseJsonFromAsset(String filename) async {
    final jsonString = await _loadFromAsset('assets/dummy_data/$filename');
    return jsonDecode(jsonString);
  }

  Future<String> _loadFromAsset(String filePath) async =>
      rootBundle.loadString(filePath);
}
