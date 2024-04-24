import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';
import 'package:healthapp/model/nutrient_graph.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'firebase_options.dart';
import 'package:intl/intl.dart';
import 'dart:async';

<<<<<<< Updated upstream
=======
import '../view/nutrient_graph_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

//get the date now
// DateTime endDate = DateTime.now();
// DateTime startDate = endDate.subtract(const Duration(days: 6));
// // Use DateTime.parse to convert the formatted string to DateTime
// String formattedStartDateStr = DateFormat('yyyyMMdd').format(startDate);
// DateTime formattedStartDate = DateFormat('yyyyMMdd').parse(formattedStartDateStr);

DateTime endDate = DateTime.now();
DateTime startDate = endDate.subtract(const Duration(days: 6));
String formattedStartDateString = DateFormat('yyyyMMdd').format(startDate);
DateTime formattedStartDate = DateFormat('yyyyMMdd').parse(formattedStartDateString);

// Initialize an empty list to store the data points


>>>>>>> Stashed changes
class NutrientGraphController {
  List<Tuple3<DateTime, double, HealthGoalAttribute>> nutrientData = [];
  NutrientGraphController({required this.nutrientData});


  Future<List<Tuple3<String, double, String>>> getLogsForDates() async {
    List<Tuple3<String, double, String>> dataPoints = [];
    List<String> formattedDateList = [formattedStartDate.toString(), formattedStartDate.add(const Duration(days: 1)).toString(), formattedStartDate.add(const Duration(days: 2)).toString(), formattedStartDate.add(const Duration(days: 3)).toString(), formattedStartDate.add(const Duration(days: 4)).toString(), formattedStartDate.add(const Duration(days: 5)).toString(), formattedStartDate.add(const Duration(days: 6)).toString()];

    for (String formattedDate in formattedDateList) {
      Stream<QuerySnapshot> snapshots = FirebaseFirestore.instance
          .collection('Daily Logs')
          .doc(formattedDate)
          .collection('Food Items')
          .snapshots();
      await for (var snapshot in snapshots) {
        for (DocumentSnapshot doc in snapshot.docs) {
          double itemCarb = doc.get('carbohydrates_g');
          double itemSugar = doc.get('sugar_g');
          double itemFat = doc.get('fat_g');
          double itemProtein = doc.get("protein_g");
          String itemDate = formattedDate;
          DateTime formattedStartDate = DateFormat('yyyyMMdd').parse(formattedStartDateString);

          Tuple3<String, double, String> plotItem = (formattedStartDate, itemSugar, 'sugar') as Tuple3<String, double, String>;
          Tuple3<String, double, String> plotItem2 = (formattedStartDate, itemCarb, 'carbs') as Tuple3<String, double, String>;
          Tuple3<String, double, String> plotItem3 = (formattedStartDate, itemFat, 'fat') as Tuple3<String, double, String>;
          Tuple3<String, double, String> plotItem4 = (formattedStartDate, itemProtein, 'protein') as Tuple3<String, double, String>;
          dataPoints.add(plotItem);
          dataPoints.add(plotItem2);
          dataPoints.add(plotItem3);
          dataPoints.add(plotItem4);
        }
      }
    }

    return dataPoints;
  }


  Future<List<List<ChartData>>> fetchDataAndProcess() async {

    Future<List<Tuple3<String, double, String>>> dataPointsFuture = getLogsForDates();
    List<Tuple3<String, double, String>> dataPoints = await dataPointsFuture;

    List<List<ChartData>> chartDataList = [];
    chartDataList.add([]); // List for carbs
    chartDataList.add([]); // List for protein
    chartDataList.add([]); // List for fat
    chartDataList.add([]); // List for sugar

    // Now you have the data in dataPoints, process it here
    for (Tuple3<String, double, String> tuple in dataPoints) {
      // Access data from each tuple
      String stringDate = tuple.item1;
      double value = tuple.item2;
      String type = tuple.item3;
      DateTime date = DateTime.parse(stringDate);

      int index = 0;
      if (type == 'sugar') {
        index = 2;
      } else if (type == 'carbs') {
        index = 0;
      } else if (type == 'fat') {
        index = 3;
      } else if (type == 'protein') {
        index = 1;
      }
      chartDataList[index].add(ChartData(date, value));
    }
    return chartDataList; // Return the processed chart data
  }
}
