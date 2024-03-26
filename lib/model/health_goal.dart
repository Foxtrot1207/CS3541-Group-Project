enum HealthGoalCadence {
  daily(),
  weekly(),

}

enum HealthGoalAttribute {
  weight(),
  protein(),
  fat(),
  carbs(),
  sugar(),
  water(),
}

class HealthGoal {
  final HealthGoalCadence cadence;
  final HealthGoalAttribute attribute;
  final int target; //amount the user wants to be at at the end of the goal's period

  HealthGoal({required this.cadence, required this.attribute, required this.target});

  Map<String, dynamic> toMap() {
    return {
    'cadence': cadence,
    'attribute': attribute,
    'target': target,
    };
  }
}
