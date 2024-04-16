import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:healthapp/controller/nutrient_graph_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final DateTime  x;
  final double y;
}

class NutrientGraphView extends StatelessWidget {
  final NutrientGraphController controller;

  const NutrientGraphView({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {

    String attributeName = controller.getAttributeName(1);
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.subtract(const Duration(days: 6));

// Generate chart data for the last 7 days
    List<ChartData> chartData = [];
    for (DateTime date = startDate; date.isBefore(endDate.add(const Duration(days: 1))); date = date.add(const Duration(days: 1))) {
      // Generate some random values for demonstration
      double value = Random().nextInt(50).toDouble();
      chartData.add(ChartData(date, value));
    }


    return Scaffold(
        body: Center(
            child: SfCartesianChart(
                primaryXAxis: const DateTimeAxis(),
                legend: Legend(
                    isVisible: true,
                    title: LegendTitle(
                        text: attributeName
                    )
                ),
                series: <LineSeries>[
                  LineSeries<ChartData, DateTime>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                  )
                ]
            )
        )
    );
  }


}
