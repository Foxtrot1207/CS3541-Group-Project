import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/controller/stat_input_controller.dart';

import '../controller/nutrient_graph_controller.dart';

class StatsInputScreen extends StatefulWidget {
  NutrientGraphController controller;
  PersonInfoController inputcontroller;

  StatsInputScreen({required this.controller, required this.inputcontroller});

  @override
  _StatsInputScreenState createState() => _StatsInputScreenState();

}

class _StatsInputScreenState extends State<StatsInputScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InputStatContainer(controller: widget.inputcontroller),
    );
  }
}
