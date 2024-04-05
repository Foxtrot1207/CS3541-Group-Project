/// Represents a food item with its name, serving size, calories, and macros.
class FoodItem {
  final String name;
  final double servingSize;
  final double calories;
  final double fat;
  final double protein;
  final double carbohydrates;
  final double sugar;
  final double water;
  final double caffeine;
  
  /// final Map<String, double> macros; // Example: {'protein': 10, 'carbs': 20, 'fat': 5}

  /// Creates a new FoodItem with the specified name, serving size, calories, and macros.
  ///
  /// The [name] parameter specifies the name of the food item.
  /// The [servingSize] parameter specifies the serving size of the food item.
  /// The [calories] parameter specifies the calories of the food item.
  /// The [macros] parameter specifies the macros of the food item.
  FoodItem({required this.name, required this.servingSize, required this.calories, required this.fat, required this.protein, required this.carbohydrates, required this.sugar, required this.water, required this.caffeine});

  /// Converts the FoodItem object into a Map.
  ///
  /// Returns a map where the keys are the property names of the FoodItem and the values are the corresponding property values.
  Map<String, dynamic> toMap() {
    return {
    'name': name,
    'servingSize': servingSize,
    'calories': calories,
    'fat': fat,
    'protein': protein,
    'carbohydrates': carbohydrates,
    'sugar': sugar,
    'water': water,
    'caffeine': caffeine
  };
  }
}