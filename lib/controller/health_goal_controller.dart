import 'package:flutter/material.dart';
import 'package:healthapp/model/health_goal.dart';

class HealthGoalInputScreen extends StatefulWidget {
  @override
  _HealthGoalInputScreenState createState() => _HealthGoalInputScreenState();
}

class _HealthGoalInputScreenState extends State<HealthGoalInputScreen> {
  HealthGoalCadence? _selectedCadence;
  HealthGoalAttribute? _selectedAttribute;
  int _target = 0;

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
                  child: Text(attribute.toString().split('.').last),
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
                // For example, you could add the new goal to a list or save it to a database
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
