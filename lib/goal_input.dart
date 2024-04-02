import 'package:flutter/material.dart';

class GoalInput extends StatefulWidget {
  final String goal;

  GoalInput({required this.goal});

  @override
  _GoalInputState createState() => _GoalInputState();
}

class _GoalInputState extends State<GoalInput> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.goal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goal Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Goal',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, controller.text);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}