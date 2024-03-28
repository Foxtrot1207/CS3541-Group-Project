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

  double getStat(HealthGoalAttribute attribute) {
    return personInfo.currentAttributes[attribute]??0;
  }

  void addStat(HealthGoalAttribute attribute, double value) {
    // Is there a nicer way to do this in dart?
    personInfo.currentAttributes[attribute] = (personInfo.currentAttributes[attribute]??0) + value;
  }
  
}
