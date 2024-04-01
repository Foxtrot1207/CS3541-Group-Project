import 'package:healthapp/model/health_goal.dart';
import 'package:flutter/material.dart';

class NutrientData {
  final DateTime date;
  final double value;
  final HealthGoalAttribute nutrientType;

  NutrientData(this.date, this.value, this.nutrientType);
}
