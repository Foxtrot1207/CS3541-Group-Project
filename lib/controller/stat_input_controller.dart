import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:healthapp/model/person_info.dart';

import 'package:healthapp/model/stat_model.dart';
import 'package:healthapp/view/stat_input_view.dart';

/// A stateless widget that serves as a container for the InputStatView.
///
/// It uses a PersonInfoController to handle adding stats.
class InputStatContainer extends StatelessWidget {
  final PersonInfoController controller;

  /// Creates an instance of InputStatContainer.
  ///
  /// Requires a [PersonInfoController] to handle adding stats.
  const InputStatContainer({super.key, required this.controller});

  /// Builds the widget tree.
  ///
  /// Returns an instance of [InputStatView] with a given title and a callback
  /// for adding stats.
  @override
  Widget build(BuildContext context) {
    return InputStatView(
      title: 'Input Stat about My Food',
      addStatCallback: (String day, HealthGoalAttribute attribute, double nutrition) {
        // StatModel().addStat(day, calories, nutrition);
        // TODO: Remove this later
        controller.addStat(attribute, nutrition);
      },
    );
  }
}