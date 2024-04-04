/// Represents a food item with its name, serving size, calories, and macros.
class FoodItem {
  final String name;
  final double servingSize;
  final double calories;
  final Map<String, double> macros; // Example: {'protein': 10, 'carbs': 20, 'fat': 5}
  final double flMLWater;
  final double caffeine;

  /// Creates a new FoodItem with the specified name, serving size, calories, and macros.
  ///
  /// The [name] parameter specifies the name of the food item.
  /// The [servingSize] parameter specifies the serving size of the food item.
  /// The [calories] parameter specifies the calories of the food item.
  /// The [macros] parameter specifies the macros of the food item.
  FoodItem({required this.name, required this.servingSize, required this.calories, required this.macros, required this.flMLWater, required this.caffeine /*required this.sugar*/});

  /// Converts the FoodItem object into a Map.
  ///
  /// Returns a map where the keys are the property names of the FoodItem and the values are the corresponding property values.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'servingSize': servingSize,
      'calories': calories,
      'macros': macros,
      'caffeine': caffeine,
    };
  }
}
