import 'nutrition.dart';

class MarketItem {
  int id;
  String name;
  String manufacturer;
  String category;
  String imageUrl;
  String barcode;
  int portionInGram;
  String unit;
  Nutrition nutrition;
  bool isVegan;

  MarketItem({
    this.id,
    this.name,
    this.manufacturer,
    this.category,
    this.imageUrl,
    this.barcode,
    this.portionInGram,
    this.unit,
    this.nutrition,
    this.isVegan,
  });

  MarketItem.fromJson(dynamic json) {
    id = (json['id'] as num) as int;
    name = json['Bezeichnung'] as String;
    manufacturer = json['Hersteller'] as String;
    category = json['Kategorie'] as String;
    imageUrl = json['BildUrl'] as String;
    barcode = json['Barcode'] as String;
    portionInGram = (json['PortionInGramm'] as num).toInt();
    unit = json['Einheit'] as String;
    nutrition = Nutrition.fromJson(json);
    isVegan = json['Vegan'] as bool;
  }
}
