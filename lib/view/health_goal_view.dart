import 'package:flutter/material.dart';

import 'package:healthapp/model/health_goal.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class HealthGoalView extends StatefulWidget {
  PersonInfoController controller;
  HealthGoalView({required this.controller});

  @override
  _HealthGoalViewState createState() => _HealthGoalViewState();
}

class _HealthGoalViewState extends State<HealthGoalView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.controller.getHealthGoalCount(),
      itemBuilder: (context, index) {
        HealthGoal goal = widget.controller.getHealthGoalAt(index);
        return ListTile(
          title: Text('${goal.cadence == HealthGoalCadence.daily ? 'Daily' : 'Weekly'} ${goal.attribute.title} Goal'),
          subtitle: Text('Target: ${goal.target}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => widget.controller.removeHealthGoalAt(index),
          ),
        );
      },
    );
  }
}
