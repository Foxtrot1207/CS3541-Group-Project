import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/controller/nutrient_graph_controller.dart';
import 'package:healthapp/model/nutrient_graph.dart';
import 'package:healthapp/model/health_goal.dart';

//File for generating and viewing graphs of the different nutrients that are tracked in goals


//ToDo add in stub comment code for using SQL query to pull the nutrient data
class NutrientGraphView extends StatefulWidget {
  final NutrientGraphController controller;

  NutrientGraphView({required this.controller});

  @override
  _NutrientGraphViewState createState() => _NutrientGraphViewState();
}

class _NutrientGraphViewState extends State<NutrientGraphView> {
  List<HealthGoalAttribute> nutrientTypes = HealthGoalAttribute.values;
  Map<HealthGoalAttribute, bool> _selections = {};

  @override
  void initState() {
    super.initState();
    for (var nutrient in nutrientTypes) {
      _selections[nutrient] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrient Graph'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: nutrientTypes.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  title: Text(nutrientTypes[index].toString().split('.').last), // Convert enum to string and get the last part
                  value: _selections[nutrientTypes[index]],
                  onChanged: (bool? value) {
                    setState(() {
                      _selections[nutrientTypes[index]] = value!;
                    });
                  },
                );
              },
            ),
          ),
          // Graph display code
          Expanded(
            child: Container(
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(),
                series: <CartesianSeries>[
                  LineSeries<NutrientData, DateTime>(
                    dataSource: widget.controller.getNutrientData().where((data) => _selections.values.contains(true)).toList(),
                    xValueMapper: (NutrientData nutrient, _) => nutrient.date,
                    yValueMapper: (NutrientData nutrient, _) => nutrient.value,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
