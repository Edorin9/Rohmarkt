import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/market_item.dart';

class JsonProvider {
  // + Public

  Future<List<MarketItem>> getMarketItems() async {
    final jsonList = await _parseJsonAsset('market_items.json') as List;
    return jsonList
        .map((e) => MarketItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // + Private

  Future<dynamic> _parseJsonAsset(String filename) async {
    final jsonString = await rootBundle.loadString('assets/json/$filename');
    return jsonDecode(jsonString);
  }
}
