import 'package:flutter/material.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:healthapp/view/enum_selector.dart';

/// A widget for inputting health stats.
class InputStatView extends StatefulWidget {
  final String title;
  final TextEditingController nutritionController = TextEditingController();
  final Function(WeekDay, HealthGoalAttribute, double) addStatCallback;

  /// Creates an InputStatView widget.
  ///
  /// Requires a [title] and a callback function [addStatCallback] to add the stat.
  InputStatView({
    Key? key,
    required this.title,
    required this.addStatCallback,
  }) : super(key: key);

  @override
  _InputStatViewState createState() => _InputStatViewState();
}

/// The state for the [InputStatView] widget.
class _InputStatViewState extends State<InputStatView> {
  String caloriesToday = '';
  final ValueNotifier<HealthGoalAttribute?> _selectedAttribute = ValueNotifier<HealthGoalAttribute?>(null);
  final ValueNotifier<WeekDay?> _selectedDay = ValueNotifier<WeekDay?>(null);

  /// Builds the widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select the day:',
              style: TextStyle(fontSize: 16),
            ),
            EnumSelector<WeekDay>(
              selected: _selectedDay,
              options: { for(var v in WeekDay.values) v.title: v }
            ),
            const Text(
              'Enter the nutrition attribute:',
              style: TextStyle(fontSize: 16),
            ),
            EnumSelector<HealthGoalAttribute>(
              selected: _selectedAttribute,
              options: { for(var v in HealthGoalAttribute.values) v.title: v }
            ),
            SizedBox(height: 16),
            Text(
              'Enter the how much nutrition you took today:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: widget.nutritionController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if(_selectedAttribute.value != null && _selectedDay.value != null) {
                  widget.addStatCallback(
                    _selectedDay.value!,
                    _selectedAttribute.value!,
                    double.tryParse(widget.nutritionController.text) ?? 0,
                  );
                  widget.nutritionController.clear();
                  _selectedDay.value = null;
                  _selectedAttribute.value = null;
                }
              },
              child: Text('Submit'),
            ),
/*
            SizedBox(height: 32),
            Text(
              'Calories today: $caloriesToday',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
*/
          ],
        ),
      ),
    );
  }
}
