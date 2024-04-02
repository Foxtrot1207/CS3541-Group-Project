import 'package:healthapp/model/health_goal.dart';

/// Represents a person's health information.
///
/// It includes the current attributes and the current health goals of the person.
class PersonInfo {

  /// A map of the person's current health attributes.
  Map<HealthGoalAttribute, double> currentAttributes = {};

  /// A list of the person's current health goals.
  List<HealthGoal> currentGoals = [];

  /// Creates a new PersonInfo instance.
  ///
  /// Initializes the currentAttributes with blank values.
  PersonInfo() {
    // TODO: Pull this data from elsewhere?
    // Fill in the currentAttributes with blank values
    for(var attribute in HealthGoalAttribute.values) {
      currentAttributes[attribute] = 0;
    }
  }

}