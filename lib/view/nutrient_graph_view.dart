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
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey,
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (BuildContext context, double value) => const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                      getTitles: (value) {
                        // Format your date here
                        return '${value.toInt()}';
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (BuildContext context, double value) => const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                      getTitles: (value) {
                        return '${value.toInt()}';
                      },
                    ),
                  ),
                  borderData: FlBorderData(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: widget.controller.getNutrientData()
                          .where((data) => _selections.values.contains(true))
                          .map((data) => FlSpot(data.date.millisecondsSinceEpoch.toDouble(), data.value))
                          .toList(),
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: false,
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        colors: [Colors.blue.withOpacity(0.3)],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

