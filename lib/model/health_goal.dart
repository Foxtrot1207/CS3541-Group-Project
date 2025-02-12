
enum WeekDay {
  sunday("Sunday"),
  monday("Monday"),
  tuesday("Tuesday"),
  wednesday("Wednesday"),
  thursday("Thursday"),
  friday("Friday"),
  saturday("Saturday");

  /// Constructor for WeekDay enum.
  ///
  /// @param title The title of the day.
  const WeekDay(this.title);

  final String title;
}

/// Enum representing the cadence of a health goal.
enum HealthGoalCadence {
  daily(),
  weekly(),
}

/// Enum representing the attribute of a health goal.
enum HealthGoalAttribute {
  calories("Calories", "kcal"),
  protein("Protein", "g"),
  fat("Fat", "g"),
  carbs("Carbs", "g"),
  sugar("Sugar", "g"),
  water("Water", "ml"),
  caffeine("Caffeine", "mg");

  /// Constructor for HealthGoalAttribute enum.
  ///
  /// @param title The title of the attribute.
  const HealthGoalAttribute(this.title, this.units);

  final String title;
  final String units;
}

/// Class representing a health goal.
class HealthGoal {
  final HealthGoalCadence cadence;
  final HealthGoalAttribute attribute;
  final int target; //amount the user wants to be at at the end of the goal's period
  
  // When the goal was hit
  DateTime? achievedAt = null;

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