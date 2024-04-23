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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Current Health Goals',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24), // Optional: Set a specific style for the text
          ),
          Align(
            alignment: Alignment.centerRight, // Align button to the right
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HealthGoalCreateScreen(controller: widget.controller),
                  ),
                );
              },
              child: Text('Create Health Goal'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent.shade100,), // Background color
                foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 20, // Text font size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: HealthGoalView(
              controller: widget.controller,
            ),
          ),
          SizedBox(height: 100),
          GoalProgressView(
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
