class HealthGoal {
  final int goal_type; //daily macro goal, weekly weight goal (0 for daily 1 for weekly)
  final Map<String, double> macros_goal; // Example: {'protein': 10, 'carbs': 20, 'fat': 5} the goal of how much they want daily
  final int weight_goal; //amount of weight the user wants to be at at the end of the week
  HealthGoal({required this.goal_type), required this.macros_goal, required this.weight_goal})

  Map<String, dynamic> toMap() {
    return {
    'goal_type': goal_type,
    'macros_goal': macros_goal,
    'weight_goal': weight_goal,
    };
  }
}