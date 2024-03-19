

class GoalController {
  void createGoal(string goalName, String goalDescription, DateTime deadline) {
    Goal newGoal = Goal(goalName: goalName, goalDescription: goalDescription, deadline: deadline);
  }

}