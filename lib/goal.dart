class Goal {
  String goalName;
  String goalDescription;
  DateTime deadline;

  Goal({required this.goalName, required this.goalDescription, required this.deadline});

  Map<String, dynamic> toMap() {
    return {
      'goalName': goalName,
      'goalDescription': goalDescription,
      'deadline': deadline,
    };
  }
}