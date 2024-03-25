import 'package:flutter/material.dart';
import 'GoalInput.dart';

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
      body: ListView.builder(
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
      FloatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GoalInput()),
          );
          if (result != null) {
            setState(() {
              goals.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}