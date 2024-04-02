import 'package:flutter/material.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:healthapp/controller/person_info_controller.dart';

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
  HealthGoalCadence? _selectedCadence;
  HealthGoalAttribute? _selectedAttribute;
  int _target = 0;

  /// Builds the widget tree for this screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Goal Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            DropdownButton<HealthGoalCadence>(
              value: _selectedCadence,
              onChanged: (HealthGoalCadence? newValue) {
                setState(() {
                  _selectedCadence = newValue;
                });
              },
              items: HealthGoalCadence.values.map((HealthGoalCadence cadence) {
                return DropdownMenuItem<HealthGoalCadence>(
                  value: cadence,
                  child: Text(cadence.toString().split('.').last),
                );
              }).toList(),
            ),
            DropdownButton<HealthGoalAttribute>(
              value: _selectedAttribute,
              onChanged: (HealthGoalAttribute? newValue) {
                setState(() {
                  _selectedAttribute = newValue;
                });
              },
              items: HealthGoalAttribute.values.map((HealthGoalAttribute attribute) {
                return DropdownMenuItem<HealthGoalAttribute>(
                  value: attribute,
                  child: Text(attribute.title),
                );
              }).toList(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _target = int.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Target',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the submission of the health goal
                if (_selectedCadence != null && _selectedAttribute != null) {
                  widget.controller.addHealthGoal(HealthGoal(cadence: _selectedCadence??HealthGoalCadence.daily, attribute: _selectedAttribute??HealthGoalAttribute.water, target: _target));
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
