import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/model/health_goal.dart';

class GoalProgressView extends StatefulWidget {
  final PersonInfoController controller;

  GoalProgressView({super.key, required this.controller});

  @override
  State<GoalProgressView> createState() => _GoalProgressWidgetState();
}

class _GoalProgressWidgetState extends State<GoalProgressView> {
  @override
  void initState() {
    super.initState();
  }

  TableRow buildRow(HealthGoal goal) {
    return TableRow(
      children: <Widget>[
        Text(goal.attribute.title),
        LinearProgressIndicator(
          value: (widget.controller.getStat(goal.attribute) / goal.target.toDouble()), // Temporary value!
          semanticsLabel: 'Goal progress indicator',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    List<TableRow> children = <TableRow>[];
    for(int i = 0; i < widget.controller.getHealthGoalCount(); i++) {
      HealthGoal goal = widget.controller.getHealthGoalAt(i);
      children.add(buildRow(goal));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder(),
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(0.2),
          1: FlexColumnWidth(0.8),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: children
      )
    );
  }
}
