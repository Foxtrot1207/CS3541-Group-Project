import 'package:healthapp/model/person_info.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:flutter/material.dart';

/// Controller for managing person's health information and goals.
class PersonInfoController extends ChangeNotifier {
  PersonInfo personInfo;

  /// Constructor for PersonInfoController.
  ///
  /// Requires [personInfo] as a parameter.
  PersonInfoController({required this.personInfo});

  /// Returns the count of current health goals.
  int getHealthGoalCount() {
    return personInfo.currentGoals.length;
  }

  /// Returns the health goal at a particular [index].
  HealthGoal getHealthGoalAt(int index) {
    return personInfo.currentGoals[index];
  }

  /// Adds a [goal] to the current health goals.
  void addHealthGoal(HealthGoal goal) {
    personInfo.currentGoals.add(goal);
    notifyListeners();
  }

  /// Removes a [goal] from the current health goals.
  void removeHealthGoal(HealthGoal goal) {
    personInfo.currentGoals.remove(goal);
    notifyListeners();
  }

  /// Removes a health goal at a particular [index].
  void removeHealthGoalAt(int index) {
    personInfo.currentGoals.removeAt(index);
    notifyListeners();
  }

  /// Returns the stat for a particular [attribute].
  double getStat(HealthGoalAttribute attribute) {
    return personInfo.currentAttributes[attribute]??0;
  }

  /// Adds a [value] to the stat for a particular [attribute].
  void addStat(HealthGoalAttribute attribute, double value) {
    // Is there a nicer way to do this in dart?
    personInfo.currentAttributes[attribute] = (personInfo.currentAttributes[attribute]??0) + value;
    notifyListeners();
  }

}