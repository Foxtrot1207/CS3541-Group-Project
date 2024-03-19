

class GoalController {
  final database = Placeholder;

  void createGoal(string goalName, String goalDescription, DateTime deadline) {
    Goal newGoal = Goal(goalName: goalName, goalDescription: goalDescription, deadline: deadline);
    database.insert('goals', newGoal.toMap());
  }

  void editGoal(Goal goal, String newGoalName, String newGoalDescription, DateTime newDeadline) {
    goal.goalName = newGoalName;
    goal.goalDescription = newGoalDescription;
    goal.deadline = newDeadline;
  }

}