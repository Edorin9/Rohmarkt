import 'package:equatable/equatable.dart';

class MarketItem extends Equatable {
  final int id;
  final String name;
  final String manufacturer;
  final String category;
  final String imageUrl;
  final String barcode;
  final int portionInGram;
  final String unit;
  final int sugar;
  final int calories;
  final int protein;
  final int carbohydrates;
  final int fat;
  final int water;
  final bool isVegan;

  const MarketItem({
    this.id,
    this.name,
    this.manufacturer,
    this.category,
    this.imageUrl,
    this.barcode,
    this.portionInGram,
    this.unit,
    this.sugar,
    this.calories,
    this.protein,
    this.carbohydrates,
    this.fat,
    this.water,
    this.isVegan,
  });

  factory MarketItem.fromJson(dynamic json) => MarketItem(
        id: (json['id'] as num) as int,
        name: json['Bezeichnung'] as String,
        manufacturer: json['Hersteller'] as String,
        category: json['Kategorie'] as String,
        imageUrl: json['BildUrl'] as String,
        barcode: json['Barcode'] as String,
        portionInGram: (json['PortionInGramm'] as num) as int,
        unit: json['Einheit'] as String,
        sugar: (json['Zucker'] as num) as int,
        calories: (json['Kalorien'] as num) as int,
        protein: (json['Eiweiss'] as num) as int,
        carbohydrates: (json['Kohlenhydrate'] as num) as int,
        fat: (json['Fett'] as num) as int,
        water: (json['Wasser'] as num) as int,
        isVegan: json['Vegan'] as bool,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'Bezeichnung': name,
        'Hersteller': manufacturer,
        'Kategorie': category,
        'BildUrl': imageUrl,
        'Barcode': barcode,
        'PortionInGramm': portionInGram,
        'Einheit': unit,
        'Zucker': sugar,
        'Kalorien': calories,
        'Eiweiss': protein,
        'Kohlenhydrate': carbohydrates,
        'Fett': fat,
        'Wasser': water,
        'Vegan': isVegan,
      };

  @override
  List<Object> get props => [
        id,
        name,
        manufacturer,
        category,
        imageUrl,
        barcode,
        portionInGram,
        unit,
        sugar,
        calories,
        protein,
        carbohydrates,
        fat,
        water,
        isVegan,
      ];
}
