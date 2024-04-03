import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class HealthGoalScreen extends StatefulWidget {
  PersonInfoController controller;
  HealthGoalScreen({required this.controller});

  @override
  _HealthGoalScreenState createState() => _HealthGoalScreenState();
}

class _HealthGoalScreenState extends State<HealthGoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Placeholder( //Active Health Goals Placeholder
            fallbackHeight:200, //size of box
            color: Colors.lightBlue!, //color of box
          ),

          SizedBox(height: 100), //Space between placeholders

          Placeholder( //Progress Bar Placeholder
            fallbackHeight:350,  //size of box
            color: Colors.purple!,  //color of box
          ),
        ],
      ),
    );
  }
}