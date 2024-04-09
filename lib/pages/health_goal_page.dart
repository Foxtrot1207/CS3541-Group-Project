import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/view/health_goal_view.dart';
import 'package:healthapp/view/progress_widget.dart';
import 'health_goal_create_page.dart';

class HealthGoalScreen extends StatefulWidget {
  final PersonInfoController controller;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight, //Centered right like wireframe
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealthGoalCreateScreen(controller: widget.controller),
                  ),
                );
              },
              child: Text('Create Health Goal'), // Button text
            ),
          ),
          
          Expanded(
            child: HealthGoalView(
              controller: widget.controller,
            ),
          ),

          SizedBox(height: 100), //Space between placeholders

          GoalProgressView( 
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
