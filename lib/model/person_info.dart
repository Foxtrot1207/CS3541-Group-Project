import 'package:healthapp/model/health_goal.dart';

class PersonInfo {

  Map<HealthGoalAttribute, double> currentAttributes = {};
  List<HealthGoal> currentGoals = [];

  PersonInfo() {
    // TODO: Pull this data from elsewhere?
    // Fill in the currentAttributes with blank values
    for(var attribute in HealthGoalAttribute.values) {
      currentAttributes[attribute] = 0;
    }
  }

}
