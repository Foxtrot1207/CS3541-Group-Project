import 'package:tuple/tuple.dart';
import 'package:healthapp/model/nutrient_graph.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'firebase_options.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class NutrientGraphController {
  List<Tuple3<DateTime, double, HealthGoalAttribute>> nutrientData = [];
  NutrientGraphController({required this.nutrientData});

  void addNutrientData(NutrientData date, value, attribute) {
    Tuple3<DateTime, double, HealthGoalAttribute> newNutrient = (date, value, attribute) as Tuple3<DateTime, double, HealthGoalAttribute>;
    nutrientData.add(newNutrient);
  }

  List<Tuple3<DateTime, double, HealthGoalAttribute>> getNutrientData() {
    return nutrientData;
  }

  bool hasDataForSelectedTypes(Map<HealthGoalAttribute, bool> selections) {
    return nutrientData.any((data) => selections[data.item3] == true);
  }

  String getAttributeName(int index) {
    return nutrientData[index].item3.name;
  }
}

