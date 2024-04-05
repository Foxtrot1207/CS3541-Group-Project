import 'package:healthapp/model/health_goal.dart';
import 'package:flutter/material.dart';

class NutrientData {
  final DateTime date;
  final double value;
  final HealthGoalAttribute attribute;
  NutrientData(this.date, this.value, this.attribute);
}
