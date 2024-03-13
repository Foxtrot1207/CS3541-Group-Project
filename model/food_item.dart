class FoodItem {
  final String id;
  final String name;
  final int calories;
  final Map<String, double> macros; // Example: {'protein': 10, 'carbs': 20, 'fat': 5}

  FoodItem({required this.id, required this.name, required this.calories, required this.macros});

  // Convert a FoodItem into a Map. The keys must correspond to the names of the
  // columns in your database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'calories': calories,
      'macros': macros,
    };
  }
}
