import 'package:healthapp/model/health_goal.dart';


class GoalController {
  final database = Placeholder;
  final notificationService = Placeholder;

  void createGoal(String goalName, String goalDescription, DateTime deadline) {
    HealthGoal newGoal = HealthGoal(goalName: goalName, goalDescription: goalDescription, deadline: deadline);
    database.insert('goals', newGoal.toMap());
  }

  void editGoal(HealthGoal goal, String newGoalName, String newGoalDescription, DateTime newDeadline) {
    goal.goalName = newGoalName;
    goal.goalDescription = newGoalDescription;
    goal.deadline = newDeadline;
    database.update('goals', goal.toMap(), where: 'id = ?', whereArgs: [goal.id]);
  }

  void checkGoalStatus(HealthGoal goal) {

    if (goalReached) {
      notificationService.sendNotification('Goal reached', 'You have reached your goal: ${goal.goalName}');
    }

  }

}