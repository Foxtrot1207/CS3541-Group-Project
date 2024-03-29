class FoodItem {
  final String name;
  final double servingSize;
  final double calories;
  final Map<String, double> macros; // Example: {'protein': 10, 'carbs': 20, 'fat': 5}
  //final double sugar;

  FoodItem({required this.name, required this.servingSize, required this.calories, required this.macros,  /*required this.sugar*/});

  // Convert a FoodItem into a Map. The keys must correspond to the names of the
  // columns in your database.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'servingSize': servingSize,
      'calories': calories,
      'macros': macros,
      //'sugar': sugar
    };
  }
}