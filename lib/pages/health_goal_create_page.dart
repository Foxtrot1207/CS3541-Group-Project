import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

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
      body: Column(
        children: [
          Placeholder( //Create Health Goals Placeholder
            fallbackHeight:500, //size of box
            color: Colors.pink!, //color of box
          ),
        ],
      ),
    );
  }
}