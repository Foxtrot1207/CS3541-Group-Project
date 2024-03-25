import 'package:healthapp/model/health_goal_model.dart';

class HealthGoalController {
  List<HealthGoal> healthGoals = [];

  void addHealthGoal(HealthGoal goal) {
    healthGoals.add(goal);
  }

  void removeHealthGoal(int index) {
    healthGoals.removeAt(index);
  }

// Add more methods as needed for updating or retrieving goals
}
