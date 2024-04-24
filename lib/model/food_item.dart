/// Represents a food item with its name, serving size, calories, and macros.
class FoodItem {
  final String name;
  final String serving_size;
  final double calories;
  final double fat_g;
  final double protein_g;
  final double carbohydrates_g;
  final double sugar_g;
  final double water_ml;
  final double caffeine_mg;

  /// Creates a new FoodItem with the specified name, serving size, calories, and macros.
  ///
  /// The [name] parameter specifies the name of the food item.
  /// The [servingSize] parameter specifies the serving size of the food item.
  /// The [calories] parameter specifies the calories of the food item.
  /// The [macros] parameter specifies the macros of the food item.
  FoodItem({
    required this.name,
    required this.serving_size,
    required this.calories,
    required this.fat_g,
    required this.protein_g,
    required this.carbohydrates_g,
    required this.sugar_g,
    required this.water_ml,
    required this.caffeine_mg
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
}