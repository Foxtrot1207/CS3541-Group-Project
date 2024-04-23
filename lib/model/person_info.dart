import 'package:healthapp/model/health_goal.dart';

/// Represents a person's health information.
///
/// It includes the current attributes and the current health goals of the person.
class PersonInfo {
  /// A list of the person's current health goals.
  List<HealthGoal> currentGoals = [];

  /// Last calculated BMI of the person.
  int lastBMI = 0;

  /// Last measured weight of the person in pounds.
  int lastWeight = 0;

  /// Creates a new PersonInfo instance.
  PersonInfo() {
  }
}
