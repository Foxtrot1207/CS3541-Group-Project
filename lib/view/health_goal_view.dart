import 'package:flutter/material.dart';

import 'package:healthapp/model/health_goal.dart';
import 'package:healthapp/controller/person_info_controller.dart';

/// A widget that displays a list of health goals.
///
/// It uses a [PersonInfoController] to interact with the health goals.
class HealthGoalView extends StatefulWidget {
  /// The controller used to interact with the health goals.
  final PersonInfoController controller;

  /// Creates a new health goal view.
  ///
  /// The [controller] must not be null.
  HealthGoalView({required this.controller});

  @override
  _HealthGoalViewState createState() => _HealthGoalViewState();
}

/// The state for a [HealthGoalView].
class _HealthGoalViewState extends State<HealthGoalView> {

  /// Builds the widget.
  ///
  /// This method is called by the framework when it's time to build the widget.
  /// It builds a list view of health goals.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (BuildContext context, Widget? child) {
        return rebuild(context);
      },
    );
  }

  Widget rebuild(BuildContext context) {
    return ListView.builder(
        itemCount: widget.controller.getHealthGoalCount(),
        itemBuilder: (context, index) {
          HealthGoal goal = widget.controller.getHealthGoalAt(index);
          return ListTile(
            title: Text('${goal.cadence == HealthGoalCadence.daily ? 'Daily' : 'Weekly'} ${goal.attribute.title} Goal'),
            subtitle: Text('Target: ${goal.target} (${goal.attribute.units})'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => widget.controller.removeHealthGoalAt(index),
            ),
          );
      },
    );
  }
}
