import 'package:flutter/material.dart';
import 'package:healthapp/controller/nutrient_graph_controller.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/view/nutrient_graph_view.dart';

class StatsGraphScreen extends StatefulWidget {
  NutrientGraphController controller;
  
  StatsGraphScreen({required this.controller});

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsGraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NutrientGraphView(controller: widget.controller),
    );
  }
}

