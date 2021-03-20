import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_item.freezed.dart';
part 'market_item.g.dart';

@freezed
class MarketItem with _$MarketItem {
  const factory MarketItem({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'Bezeichnung') String? name,
    @JsonKey(name: 'Hersteller') String? manufacturer,
    @JsonKey(name: 'Kategorie') String? category,
    @JsonKey(name: 'BildUrl') String? imageUrl,
    @JsonKey(name: 'Barcode') String? barcode,
    @JsonKey(name: 'PortionInGramm') int? portionInGram,
    @JsonKey(name: 'Einheit') String? unit,
    @JsonKey(name: 'Zucker') int? sugar,
    @JsonKey(name: 'Kalorien') int? calories,
    @JsonKey(name: 'Eiweiss') int? protein,
    @JsonKey(name: 'Kohlenhydrate') int? carbohydrates,
    @JsonKey(name: 'Fett') int? fat,
    @JsonKey(name: 'Wasser') int? water,
    @JsonKey(name: 'Vegan') bool? isVegan,
  }) = _MarketItem;

  factory MarketItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MarketItemFromJson(json);
}
