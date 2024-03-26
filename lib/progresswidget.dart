import 'package:flutter/material.dart';
import 'package:healthapp/model/health_goal.dart';

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

  TableRow buildRow(HealthGoal goal) {
    return TableRow(
      children: <Widget>[
        Text(goal.attribute.name),
        LinearProgressIndicator(
          value: (30.0 / goal.target.toDouble()), // Temporary value!
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
        buildRow(HealthGoal( cadence: HealthGoalCadence.daily, attribute: HealthGoalAttribute.fat, target: 100 )),
        buildRow(HealthGoal( cadence: HealthGoalCadence.weekly, attribute: HealthGoalAttribute.protein, target: 60 )),
      ],
    );
  }
}

/*

          decoration: const BoxDecoration(
            color: Colors.grey,
          ),

*/

