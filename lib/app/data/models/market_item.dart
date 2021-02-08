class MarketItem { // TODO: entitify (check number trivia bloc)
  int id;
  String name;
  String manufacturer;
  String category;
  String imageUrl;
  String barcode;
  int portionInGram;
  String unit;
  int sugar;
  int calories;
  int protein;
  int carbohydrates;
  int fat;
  int water;
  bool isVegan;

  MarketItem.fromJson(dynamic json) {
    id = (json['id'] as num) as int;
    name = json['Bezeichnung'] as String;
    manufacturer = json['Hersteller'] as String;
    category = json['Kategorie'] as String;
    imageUrl = json['BildUrl'] as String;
    barcode = json['Barcode'] as String;
    portionInGram = (json['PortionInGramm'] as num) as int;
    unit = json['Einheit'] as String;
    sugar = (json['Zucker'] as num) as int;
    calories = (json['Kalorien'] as num) as int;
    protein = (json['Eiweiss'] as num) as int;
    carbohydrates = (json['Kohlenhydrate'] as num) as int;
    fat = (json['Fett'] as num) as int;
    water = (json['Wasser'] as num) as int;
    isVegan = json['Vegan'] as bool;
  }

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
}
