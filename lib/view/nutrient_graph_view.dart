import 'dart:math';
import 'package:tuple/tuple.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/controller/nutrient_graph_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

    // DateTime endDate = DateTime.now();
    // DateTime startDate = endDate.subtract(const Duration(days: 6));
    //
    // String formattedStartDate = DateFormat('yyyyMMdd').format(startDate);
    // String formattedEndDate = DateFormat('yyyyMMdd').format(endDate);

    Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
    }

    // final FirebaseFirestore firestore = FirebaseFirestore.instance;

//get the date now
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.subtract(const Duration(days: 6));
    String formattedStartDate = DateFormat('yyyyMMdd').format(startDate);

    // List<String> dateList = [formattedStartDate.toString(), formattedStartDate.add(const Duration(days: 1)).toString(), formattedStartDate.add(const Duration(days: 2)).toString(), formattedStartDate.add(const Duration(days: 3)).toString(), formattedStartDate.add(const Duration(days: 4)).toString(), formattedStartDate.add(const Duration(days: 5)).toString(), formattedStartDate.add(const Duration(days: 6)).toString()];
    // final dailyLogsRef = firestore.collection('Daily Logs');

// Initialize an empty list to store the data points
    List<Tuple2<DateTime, double>> dataPoints = [];

// // Loop through each date in the dateList
//     for (String date in dateList) {
// // Get the collection for the current date
//       final currentDayFood = dailyLogsRef.collection(date);
// // Get the documents in the 'Food Items' collection
//       final foodItemsQuery = currentDayFood.collectionGroup('Food Items');
// // Get the documents
//       final foodItems = foodItemsQuery.get();
// // Loop through each document and add its data to the dataPoints list
//       for (var doc in foodItems.docs) {
// // Assuming the document has a 'value' field that represents the point you want to plot
//         double value = doc.data()['value'];
// // Convert the date string back to a DateTime object for plotting
//         DateTime dateTime = DateFormat('yyyyMMdd').parse(date);
// // Add the data point to the list
//         dataPoints.add(Tuple2(dateTime, value));
//       }
//     }


// Generate chart data for the last 7 days
    List<ChartData> chartData = [];
    List<ChartData> chartData2 = [];
    List<ChartData> chartData3 = [];
    List<ChartData> chartData4 = [];
    for (DateTime date = startDate; date.isBefore(endDate.add(const Duration(days: 1))); date = date.add(const Duration(days: 1))) {
      // Generate some random values for demonstration
      double value = Random().nextInt(100).toDouble();  //carbs
      double value2 = Random().nextInt(100).toDouble();  //protein
      double value3 = Random().nextInt(55).toDouble(); //sugar
      double value4 = Random().nextInt(100).toDouble();  //fat
      chartData.add(ChartData(date, value));
      chartData2.add(ChartData(date, value2));
      chartData3.add(ChartData(date, value3));
      chartData4.add(ChartData(date, value4));
    }


    return Scaffold(
        body: Center(
            child: SfCartesianChart(
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
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: 'Carbs',
                  ),
                  LineSeries<ChartData, DateTime>(
                      dataSource: chartData2,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      name: 'Protein',
                  ),
                  LineSeries<ChartData, DateTime>(
                    dataSource: chartData3,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    name: 'Sugar',
                  ),
                  LineSeries<ChartData, DateTime>(
                    dataSource: chartData4,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    name: 'Fat',
                  ),
                ]
            )
        )
    );
  }


}
