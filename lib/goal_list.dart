import 'package:flutter/material.dart';
import 'goal_input.dart';

class GoalList extends StatefulWidget {
  @override
  _GoalListState createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  List<String> goals = [];

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
