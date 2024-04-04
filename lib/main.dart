import 'package:flutter/material.dart';
import 'package:healthapp/controller/stat_input_controller.dart';

import 'package:healthapp/view/food_screen.dart';
import 'package:healthapp/view/health_goal_input.dart';
import 'package:healthapp/view/health_goal_view.dart';
import 'package:healthapp/view/food_item_view.dart';
import 'package:healthapp/view/stat_input_view.dart';
import 'package:healthapp/view/progress_widget.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/model/food_item.dart';
import 'package:healthapp/model/person_info.dart';
import 'package:healthapp/bmi_calc.dart';

/// Entry point of the application.
void main() {
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

/// This is the private State class that goes with MyApp.
class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  // TODO: Remove these two later!
  PersonInfoController _personInfoController = PersonInfoController(
      personInfo: PersonInfo()
  );
  final FoodItemController _foodItemController = FoodItemController(
      foodItems: [
        FoodItem(name: "Banana", calories: 105, servingSize: 1, macros: {}, flMLWater: 0, caffeine: 0),
        FoodItem(name: "Apple", calories: 95, servingSize: 2, macros: {}, flMLWater: 0, caffeine: 0),
      ]
  );

  late List<Widget> _children;

  /// Constructor for _MyAppState
  _MyAppState() {
    _children = [
      FoodItemView(controller: _foodItemController),
      FoodItemScreen(controller: _foodItemController),
      HealthGoalView(controller: _personInfoController),
      HealthGoalInputScreen(controller: _personInfoController),
      InputStatContainer(controller: _personInfoController),
      GoalProgressView(controller: _personInfoController),
      CalcBMIController(),
    ];
  }

  /// Function to handle tab tap event
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /// Builds the widget tree for the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Food and Health App'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Food Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'Add Food',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Health Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'Add Goal',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Input Stats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.numbers),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.scale),
              label: 'Calc BMI',
            ),
          ],
        ),
      ),
    );
  }
}
