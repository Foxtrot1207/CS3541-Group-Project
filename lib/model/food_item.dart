class FoodItem {
  final String name;
  final double calories;
  final Map<String, double> macros; // Example: {'protein': 10, 'carbs': 20, 'fat': 5}

  FoodItem({required this.name, required this.calories, required this.macros});

  // Convert a FoodItem into a Map. The keys must correspond to the names of the
  // columns in your database.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'calories': calories,
      'macros': macros,
    };
  }
}
