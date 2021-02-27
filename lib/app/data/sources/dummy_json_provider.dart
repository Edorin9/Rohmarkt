import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/market_item.dart';

class DummyJsonProvider {
  // + Public

  Future<List<MarketItem>> getMarketItems() async {
    final jsonMap = await _parseJsonFromAsset('dummy_market_items.json');
    return (jsonMap as List).map((e) => MarketItem.fromJson(e)).toList();
  }

  // + Private

  Future<dynamic> _parseJsonFromAsset(String filename) async {
    final jsonString = await _loadFromAsset('assets/dummy_data/$filename');
    return jsonDecode(jsonString);
  }

  Future<String> _loadFromAsset(String filePath) async =>
      rootBundle.loadString(filePath);
}
