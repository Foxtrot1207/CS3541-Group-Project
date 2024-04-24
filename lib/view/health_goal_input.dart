import 'package:flutter/material.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/view/enum_selector.dart';

/// A screen that allows the user to input their health goals.
class HealthGoalInputScreen extends StatefulWidget {
  /// The controller for the person's information.
  PersonInfoController controller;

  /// Creates a new health goal input screen that uses the given controller.
  ///
  /// The controller must not be null.
  HealthGoalInputScreen({required this.controller});

  @override
  _HealthGoalInputScreenState createState() => _HealthGoalInputScreenState();
}

/// The state for a [HealthGoalInputScreen].
class _HealthGoalInputScreenState extends State<HealthGoalInputScreen> {
  final ValueNotifier<HealthGoalCadence?> _selectedCadence = ValueNotifier<HealthGoalCadence?>(null);
  final ValueNotifier<HealthGoalAttribute?> _selectedAttribute = ValueNotifier<HealthGoalAttribute?>(null);
  final TextEditingController _targetController = TextEditingController();
  int _target = 0;


  /// Builds the widget tree for this screen.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder(),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(0.2),
            1: FlexColumnWidth(0.8),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: [
                Text("Cadence"),
                EnumSelector<HealthGoalCadence>(
                  selected: _selectedCadence,
                  options: { for(var v in HealthGoalCadence.values) v.name: v }
                ),
              ]
            ),

            TableRow(
              children: [
                Text("Attribute"),
                EnumSelector<HealthGoalAttribute>(
                  selected: _selectedAttribute,
                  options: { for(var v in HealthGoalAttribute.values) v.title: v }
                ),
              ]
            ),

            TableRow(
              children: [
                Text("Target"),

                ListenableBuilder(
                  listenable: _selectedAttribute,
                  builder: (BuildContext context, Widget? child) {
                      var units = _selectedAttribute.value == null ? "" : "${_selectedAttribute.value!.name} (${_selectedAttribute.value!.units})";
                      return TextField(
                        controller: _targetController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _target = int.tryParse(value) ?? 0;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: units,
                        ),
                      );
                  },
                ),
              ]
            ),
          ]
        ),

        Expanded(
          child: Center(
            child: ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                // Handle the submission of the health goal
                if (_selectedCadence.value != null && _selectedAttribute.value != null) {
                  widget.controller.addHealthGoal(HealthGoal(cadence: _selectedCadence.value!, attribute: _selectedAttribute.value!, target: _target));
                  _selectedCadence.value = null;
                  _selectedAttribute.value = null;
                  _targetController.clear();
                }
              },
            )
          )
        )
      ]
    );
  }
}
