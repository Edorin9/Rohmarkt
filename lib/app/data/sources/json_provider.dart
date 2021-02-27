import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/market_item.dart';

class JsonProvider {
  // + Public

  Future<List<MarketItem>> get marketItems async {
    final jsonMap = await _parseJsonFromAsset('market_items.json');
    return (jsonMap as List).map((e) => MarketItem.fromJson(e)).toList();
  }

  // + Private.

  Future<dynamic> _parseJsonFromAsset(String filename) async {
    final jsonString = await rootBundle.loadString('assets/json/$filename');
    return jsonDecode(jsonString);
  }
}
