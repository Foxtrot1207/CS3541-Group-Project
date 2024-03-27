import 'package:healthapp/model/person_info.dart';
import 'package:healthapp/model/health_goal.dart';

class PersonInfoController {
  PersonInfo personInfo;
  PersonInfoController({required this.personInfo});

  int getHealthGoalCount() {
    return personInfo.currentGoals.length;
  }

  HealthGoal getHealthGoalAt(int index) {
    return personInfo.currentGoals[index];
  }

  void addHealthGoal(HealthGoal goal) {
    personInfo.currentGoals.add(goal);
  }

  void removeHealthGoal(HealthGoal goal) {
    personInfo.currentGoals.remove(goal);
  }

  void removeHealthGoalAt(int index) {
    personInfo.currentGoals.removeAt(index);
  }
  
}
