import 'package:flutter/material.dart';

import 'package:healthapp/model/health_goal_model.dart';
import 'package:healthapp/controller/health_goal_controller.dart';

class HealthGoalView extends StatefulWidget {
  @override
  _HealthGoalViewState createState() => _HealthGoalViewState();
}

class _HealthGoalViewState extends State<HealthGoalView> {
  HealthGoalController controller = HealthGoalController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.healthGoals.length,
      itemBuilder: (context, index) {
        HealthGoal goal = controller.healthGoals[index];
        return ListTile(
          title: Text('Goal Type: ${goal.goal_type == 0 ? 'Daily Macro' : 'Weekly Weight'}'),
          subtitle: Text('Macros Goal: ${goal.macros_goal}, Weight Goal: ${goal.weight_goal}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => controller.removeHealthGoal(index),
          ),
        );
      },
    );
  }
}
