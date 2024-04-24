/// Represents a food item with its name, serving size, calories, and macros.
class FoodItem {
  final String name;
  final String serving_size;
  double calories = 0;
  double fat_g = 0;
  double protein_g = 0;
  double carbohydrates_g = 0;
  double sugar_g = 0;
  double water_ml = 0;
  double caffeine_mg = 0;

  /// Creates a new FoodItem with the specified name, serving size, calories, and macros.
  ///
  /// The [name] parameter specifies the name of the food item.
  /// The [serving_size] parameter specifies the serving size of the food item.
  /// The [calories] parameter specifies the calories of the food item.
  /// The [macros] parameter specifies the macros of the food item.
  FoodItem({
    required this.name,
    required this.serving_size,
    this.calories = 0,
    this.fat_g = 0,
    this.protein_g = 0,
    this.carbohydrates_g = 0,
    this.sugar_g = 0,
    this.water_ml = 0,
    this.caffeine_mg = 0
  });

  FoodItem.fromMap(Map<String, dynamic> map)
      : name = map['name'] ?? '',
        serving_size = map['serving_size'] ?? '',
        calories = (map['calories'] ?? 0).toDouble(),
        fat_g = (map['fat_g'] ?? 0).toDouble(),
        protein_g = (map['protein_g'] ?? 0).toDouble(),
        carbohydrates_g = (map['carbohydrates_g'] ?? 0).toDouble(),
        sugar_g = (map['sugar_g'] ?? 0).toDouble(),
        water_ml = (map['water_ml_ml'] ?? 0).toDouble(),
        caffeine_mg = (map['caffeine_mg'] ?? 0).toDouble();

  /// Converts the FoodItem object into a Map.
  ///
  /// Returns a map where the keys are the property names of the FoodItem and the values are the corresponding property values.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'serving_size': serving_size,
      'calories': calories,
      'fat_g': fat_g,
      'protein_g': protein_g,
      'carbohydrates_g': carbohydrates_g,
      'sugar_g': sugar_g,
      'water_ml': water_ml,
      'caffeine_mg': caffeine_mg
    };
  }

  FoodItem operator +(FoodItem other) {
    FoodItem f = FoodItem(name: name, serving_size: serving_size);
    f.calories        = other.calories + calories;
    f.fat_g           = other.fat_g + fat_g;
    f.protein_g       = other.protein_g + protein_g;
    f.carbohydrates_g = other.carbohydrates_g + carbohydrates_g;
    f.sugar_g         = other.sugar_g + sugar_g;
    f.water_ml        = other.water_ml + water_ml;
    f.caffeine_mg     = other.caffeine_mg + caffeine_mg;
    return f;
  }
}