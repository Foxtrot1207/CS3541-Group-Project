import 'package:flutter/material.dart';
import 'package:healthapp/model/health_goal.dart';

/// A widget for inputting health stats.
class InputStatView extends StatefulWidget {
  final String title;
  final TextEditingController nutritionController = TextEditingController();
  final Function(String, HealthGoalAttribute, double) addStatCallback;

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
  String selectedDay = 'Monday';
  String caloriesToday = '';
  HealthGoalAttribute? _selectedAttribute;

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
            DropdownButton<String>(
              value: selectedDay,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedDay = newValue;
                  });
                }
              },
              items: <String>[
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const Text(
              'Enter the nutrition attribute:',
              style: TextStyle(fontSize: 16),
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
                widget.addStatCallback(
                  selectedDay,
                  _selectedAttribute ?? HealthGoalAttribute.water,
                  double.tryParse(widget.nutritionController.text) ?? 0,
                );
                widget.nutritionController.clear();
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
