class Nutrition {
  int sugar;
  int calories;
  int protein;
  int carbohydrates;
  int fat;
  int water;

  Nutrition({
    this.sugar,
    this.calories,
    this.protein,
    this.carbohydrates,
    this.fat,
    this.water,
  });

  Nutrition.fromJson(dynamic json) {
    sugar = (json['Zucker'] as num).toInt();
    calories = (json['Kalorien'] as num).toInt();
    protein = (json['Eiweiss'] as num).toInt();
    carbohydrates = (json['Kohlenhydrate'] as num).toInt();
    fat = (json['Fett'] as num).toInt();
    water = (json['Wasser'] as num).toInt();
  }
}
