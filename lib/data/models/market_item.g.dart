// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarketItem _$_$_MarketItemFromJson(Map<String, dynamic> json) {
  return _$_MarketItem(
    id: json['id'] as int?,
    name: json['Bezeichnung'] as String?,
    manufacturer: json['Hersteller'] as String?,
    category: json['Kategorie'] as String?,
    imageUrl: json['BildUrl'] as String?,
    barcode: json['Barcode'] as String?,
    portionInGram: json['PortionInGramm'] as int?,
    unit: json['Einheit'] as String?,
    sugar: json['Zucker'] as int?,
    calories: json['Kalorien'] as int?,
    protein: json['Eiweiss'] as int?,
    carbohydrates: json['Kohlenhydrate'] as int?,
    fat: json['Fett'] as int?,
    water: json['Wasser'] as int?,
    isVegan: json['Vegan'] as bool?,
  );
}

Map<String, dynamic> _$_$_MarketItemToJson(_$_MarketItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Bezeichnung': instance.name,
      'Hersteller': instance.manufacturer,
      'Kategorie': instance.category,
      'BildUrl': instance.imageUrl,
      'Barcode': instance.barcode,
      'PortionInGramm': instance.portionInGram,
      'Einheit': instance.unit,
      'Zucker': instance.sugar,
      'Kalorien': instance.calories,
      'Eiweiss': instance.protein,
      'Kohlenhydrate': instance.carbohydrates,
      'Fett': instance.fat,
      'Wasser': instance.water,
      'Vegan': instance.isVegan,
    };
