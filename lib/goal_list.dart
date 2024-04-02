import 'package:flutter/material.dart';
import 'goal_input.dart';

/// A StatefulWidget class that represents a list of goals.
class GoalList extends StatefulWidget {
  /// Creates the mutable state for this widget at a given location in the tree.
  @override
  _GoalListState createState() => _GoalListState();
}

/// The logic and internal state for a StatefulWidget.
class _GoalListState extends State<GoalList> {
  /// A list of goals.
  List<String> goals = [];

  /// Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Goal List'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListView.builder(
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(goals[index]),
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GoalInput(goal: goals[index])),
                          );
                          if (result != null) {
                            setState(() {
                              goals[index] = result;
                            });
                          }
                        },
                      );
                    },
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoalInput(goal: "Goal Temp Text")),
                      );
                      if (result != null) {
                        setState(() {
                          goals.add(result);
                        });
                      }
                    },
                    child: Icon(Icons.add),
                  )
                ]
            )
        )
    );
  }
}