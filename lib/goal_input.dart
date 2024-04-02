import 'package:flutter/material.dart';

/// A StatefulWidget that allows the user to input a goal.
class GoalInput extends StatefulWidget {
  /// The initial goal text.
  final String goal;

  /// Creates a new GoalInput widget.
  ///
  /// The [goal] argument must not be null.
  GoalInput({required this.goal});

  @override
  _GoalInputState createState() => _GoalInputState();
}

/// The state for a [GoalInput] widget.
class _GoalInputState extends State<GoalInput> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.goal);
  }

  /// Builds the widget tree for the [GoalInput] widget.
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