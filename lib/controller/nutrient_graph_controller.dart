import 'package:healthapp/model/nutrient_graph.dart';
import 'package:flutter/material.dart';

class NutrientGraphController {
  List<NutrientData> nutrientData = [];

  void addNutrientData(NutrientData data) {
    nutrientData.add(data);
  }

  List<NutrientData> getNutrientData() {
    return nutrientData;
  }
}
