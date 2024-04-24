import 'package:flutter/material.dart';
import 'package:healthapp/controller/nutrient_graph_controller.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/main.dart';
import 'package:healthapp/model/nutrition_tracker.dart';
import 'package:intl/intl.dart';


class StatsComparisonScreen extends StatefulWidget {
  NutrientGraphController controller;
  PersonInfoController inputcontroller;
  FoodItemController foodItemController;

  StatsComparisonScreen({required this.controller,required this.inputcontroller, required this.foodItemController});

  @override
  _StatsComparisonScreenState createState() => _StatsComparisonScreenState();
}


class _StatsComparisonScreenState extends State<StatsComparisonScreen> {
  DateTime selectedDate = DateTime.now();
  late Future<Map<String, double>> todayNutritionData;
  late Future<Map<String, double>> yesterdayNutritionData;

  @override
  void initState() {
    super.initState();
    todayNutritionData = fetchNutritionData(selectedDate);
    yesterdayNutritionData = fetchYesterdayNutritionData(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stats Comparison"),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate;
                });
                todayNutritionData = fetchNutritionData(selectedDate);
                yesterdayNutritionData = fetchYesterdayNutritionData(selectedDate);
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text('Comparison for ${DateFormat.yMd().format(selectedDate)}'),
          ),
          FutureBuilder<Map<String, double>>(
            future: todayNutritionData,
            builder: (context, todaySnapshot) {
              if (todaySnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (todaySnapshot.hasError) {
                return Text('Error: ${todaySnapshot.error}');
              } else {
                final todayData = todaySnapshot.data!;
                return FutureBuilder<Map<String, double>>(
                  future: yesterdayNutritionData,
                  builder: (context, yesterdaySnapshot) {
                    if (yesterdaySnapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (yesterdaySnapshot.hasError) {
                      return Text('Error: ${yesterdaySnapshot.error}');
                    } else {
                      final yesterdayData = yesterdaySnapshot.data!;
                      return DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text('Nutrient')),
                          DataColumn(label: Text('Today')),
                          DataColumn(label: Text('Yesterday')),
                        ],
                        rows: todayData.entries.map((entry) {
                          final yesterdayIntake = yesterdayData[entry.key] ?? 0.0;
                          return DataRow(cells: [
                            DataCell(Text(entry.key)),
                            DataCell(Text(entry.value.toStringAsFixed(2))),
                            DataCell(Text(yesterdayIntake.toStringAsFixed(2))),
                          ]);
                        }).toList(),
                      );
                    }
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future<Map<String, double>> fetchNutritionData(DateTime date) {
    return widget.foodItemController.getNutritionDataForDate(date);
  }

  Future<Map<String, double>> fetchYesterdayNutritionData(DateTime date) {
    final yesterday = date.subtract(Duration(days: 1));
    return widget.foodItemController.getNutritionDataForDate(yesterday);
  }
}