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
                widget.foodItemController.setLogDate(selectedDate);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text('Comparison for ${DateFormat.yMd().format(selectedDate)}'),
          ),
          DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text('Nutrient'),
              ),
              DataColumn(
                label: Text('Daily Intake'),
              ),
              DataColumn(
                label: Text('Weekly Intake'),
              ),
            ],
            rows: widget.foodItemController.nutritonTracker.dailyValues.keys.map((key) => DataRow(
              cells: <DataCell>[
                DataCell(Text(key)),
                DataCell(Text('${widget.foodItemController.nutritonTracker.dailyValues[key]}')),
                DataCell(Text('${widget.foodItemController.nutritonTracker.weeklyValues[key]}')),
              ],
            )).toList(),
          ),
        ],
      ),
    );
  }
}