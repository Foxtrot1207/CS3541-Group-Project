import 'package:flutter/material.dart';
import 'goal.dart';

class GoalProgressWidget extends StatefulWidget {
  GoalProgressWidget({super.key});

  @override
  State<GoalProgressWidget> createState() => _GoalProgressWidgetState();
}

class _GoalProgressWidgetState extends State<GoalProgressWidget> {
  @override
  void initState() {
    super.initState();
  }

  TableRow buildRow(Goal goal) {
    return TableRow(
      children: <Widget>[
        Text(goal.goalName),
        LinearProgressIndicator(
          value: goal.getProgress(),
          semanticsLabel: 'Goal progress indicator',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(0.2),
        1: FlexColumnWidth(0.8),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        buildRow(Goal( goalName: "test 1", goalDescription: "desc", deadline: DateTime(0), target: 100, current: 25)),
        buildRow(Goal( goalName: "test 2", goalDescription: "desc", deadline: DateTime(0), target: 60, current: 20)),
      ],
    );
  }
}

/*

          decoration: const BoxDecoration(
            color: Colors.grey,
          ),

*/

