import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:healthapp/controller/nutrient_graph_controller.dart';

class NutrientGraphView extends StatelessWidget {
  final NutrientGraphController controller;

  const NutrientGraphView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // Assuming you have a method in your controller to get the attribute name
    String attributeName = controller.getAttributeName(1);
    return LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return const FlLine(
                  color: Colors.grey,
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return const FlLine(
                  color: Colors.grey,
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  getTitlesWidget: (value, meta) {
                    return Transform.rotate(
                      angle: -pi / 6, // 60 degrees
                      child: Text(
                        '${value.toInt()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 22,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '${value.toInt()}', // Assuming this is the attribute being displayed
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    );
                  },
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),),
            ),
            borderData: FlBorderData(
              border: Border.all(color: Colors.black, width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: controller.getNutrientData().map((data) {
                  return FlSpot(data.item1.millisecondsSinceEpoch.toDouble(), data.item2);
                }).toList(),
                isCurved: true,
                color: Colors.blue, // Updated to use 'color' instead of 'colors'
                barWidth: 2,
                isStrokeCapRound: true,
                dotData: const FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.blue.withOpacity(0.3), // Updated to use 'color' instead of 'colors'
                ),
              ),
            ],
            // Add a legend
          ),
    );
  }
}
