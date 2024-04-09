import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/model/health_goal.dart';

/// A widget that displays the progress of health goals.
///
/// This widget requires a [PersonInfoController] to function.
class GoalProgressView extends StatefulWidget {
  /// The [PersonInfoController] that this widget will use to retrieve health goal data.
  final PersonInfoController controller;

  /// Creates a new [GoalProgressView].
  ///
  /// The [controller] argument must not be null.
  GoalProgressView({super.key, required this.controller});

  @override
  State<GoalProgressView> createState() => _GoalProgressWidgetState();
}

class _GoalProgressWidgetState extends State<GoalProgressView> {
  @override
  void initState() {
    super.initState();
  }

  /// Builds a table row for a given health goal.
  ///
  /// The row contains the title of the goal and a progress indicator.
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

  /// Rebuild whenever the controller is updated
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (BuildContext context, Widget? child) {
        return rebuild(context);
      },
    );
  }

  /// Builds the widget tree for this widget.
  Widget rebuild(BuildContext context) {

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
