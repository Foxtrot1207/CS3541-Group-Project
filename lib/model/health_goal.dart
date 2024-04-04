/// Enum representing the cadence of a health goal.
enum HealthGoalCadence {
  daily(),
  weekly(),
}

/// Enum representing the attribute of a health goal.
enum HealthGoalAttribute {
  weight(title: "Weight"),
  protein(title: "Protein"),
  fat(title: "Fat"),
  carbs(title: "Carbs"),
  sugar(title: "Sugar"),
  water(title: "Water"),
  caffeine(title: "Caffeine");

  /// Constructor for HealthGoalAttribute enum.
  ///
  /// @param title The title of the attribute.
  const HealthGoalAttribute({required this.title});

  final String title;
}

/// Class representing a health goal.
class HealthGoal {
  final HealthGoalCadence cadence;
  final HealthGoalAttribute attribute;
  final int target; //amount the user wants to be at at the end of the goal's period

  /// Constructor for HealthGoal class.
  ///
  /// @param cadence The cadence of the goal.
  /// @param attribute The attribute of the goal.
  /// @param target The target amount for the goal.
  HealthGoal({required this.cadence, required this.attribute, required this.target});

  /// Converts the HealthGoal object to a map.
  ///
  /// @return A map representing the HealthGoal object.
  Map<String, dynamic> toMap() {
    return {
      'cadence': cadence,
      'attribute': attribute,
      'target': target,
    };
  }
}