import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/view/health_goal_input.dart';

class HealthGoalCreateScreen extends StatefulWidget {
  PersonInfoController controller;
  HealthGoalCreateScreen({required this.controller});

  @override
  _HealthGoalCreateScreenState createState() => _HealthGoalCreateScreenState();
}

class _HealthGoalCreateScreenState extends State<HealthGoalCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HealthGoalInputScreen(controller: widget.controller)
      )
    );
  }
}
