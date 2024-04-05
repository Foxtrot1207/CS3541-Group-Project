import 'package:flutter/material.dart';

class NutritionTrackerWidget extends StatelessWidget {
  final Map<String, double> dailyValues;
  final Map<String, double> weeklyValues;

  NutritionTrackerWidget({required this.dailyValues, required this.weeklyValues});

  String getUnit(String nutrient) {
    switch (nutrient) {
      case 'caffeine':
        return 'mg';
      case 'water':
        return 'mL';
      default:
        return 'g';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dailyValues.keys.map((key) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key, style: TextStyle(fontWeight: FontWeight.bold)),
          Text('${dailyValues[key]}${getUnit(key)}'),
          Text('${weeklyValues[key]}${getUnit(key)}'),
        ],
      )).toList(),
    );
  }
}
