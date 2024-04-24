import 'dart:math';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/controller/nutrient_graph_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/food_item.dart';

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
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<List<ChartData>>>(
          future: controller.fetchDataAndProcess(), // Get the future object
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Show an error message if there's an error
              return Text('Error: ${snapshot.error}');
            } else {
              // Access the processed chart data (snapshot.data!)
              List<List<ChartData>> chartDataList = snapshot.data!;

              // Generate chart data based on chartDataList

              //get the date now
                //DateTime endDate = DateTime.now();
                //DateTime startDate = endDate.subtract(const Duration(days: 6));
                //String formattedStartDate = DateFormat('yyyyMMdd').format(startDate);

              //collect the fooditems

              List<ChartData> chartDataCarbs = chartDataList[0];
              List<ChartData> chartDataProtein = chartDataList[1];
              List<ChartData> chartDataSugar = chartDataList[2];
              List<ChartData> chartDataFat = chartDataList[3];

              return SfCartesianChart(
                  primaryXAxis: const DateTimeAxis(
                    title: AxisTitle(
                      text: 'Date', // Set the title of the axis
                      textStyle: TextStyle(
                        color: Colors.black, // Customize the text color
                        fontFamily: 'Roboto', // Customize the font family
                        fontSize: 16, // Customize the font size
                        fontStyle: FontStyle.normal, // Customize the font style
                        fontWeight: FontWeight.w400, // Customize the font weight
                      ),
                    ),
                    intervalType: DateTimeIntervalType.days, // Set the interval type to days
                    interval: 1, // Set the interval to 1 day
                  ),
                  primaryYAxis: const NumericAxis(
                    title: AxisTitle(
                      text: 'Grams', // Set the title of the Y-axis
                      textStyle: TextStyle(
                        color: Colors.black, // Customize the text color
                        fontFamily: 'Roboto', // Customize the font family
                        fontSize: 16, // Customize the font size
                        fontStyle: FontStyle.normal, // Customize the font style
                        fontWeight: FontWeight.w400, // Customize the font weight
                      ),
                    ),
                  ),
                  legend: const Legend(
                      isVisible: true,
                      title: LegendTitle(
                          text: "Daily Intake"
                      )
                  ),
                  series: <LineSeries>[
                    LineSeries<ChartData, DateTime>(
                      dataSource: chartDataCarbs,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: 'Carbs',
                    ),
                    LineSeries<ChartData, DateTime>(
                      dataSource: chartDataProtein,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: 'Protein',
                    ),
                    LineSeries<ChartData, DateTime>(
                      dataSource: chartDataSugar,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: 'Sugar',
                    ),
                    LineSeries<ChartData, DateTime>(
                      dataSource: chartDataFat,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: 'Fat',
                    ),
                  ]
              );
            }
          },
        ),
      ),
    );
  }
}
