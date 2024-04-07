import 'package:flutter/material.dart';
import 'package:healthapp/controller/nutrient_graph_controller.dart';
import 'package:healthapp/controller/stat_input_controller.dart';
import 'package:healthapp/pages/health_goal_page.dart';
import 'package:healthapp/pages/home_page.dart';
import 'package:healthapp/pages/log_page.dart';
import 'package:healthapp/pages/profile_page.dart';
import 'package:healthapp/pages/stats_page_overview.dart';

import 'package:healthapp/model/health_goal.dart';
import 'package:tuple/tuple.dart';
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

import 'package:healthapp/model/nutrient_graph.dart';
import 'package:healthapp/view/nutrient_graph_view.dart';
import 'package:healthapp/controller/nutrient_graph_controller.dart';
import 'package:healthapp/bmi_Calc.dart';

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
  int _currentIndex = 2;

  // TODO: Remove these two later!
  PersonInfoController _personInfoController = PersonInfoController(
      personInfo: PersonInfo()
  );
  final FoodItemController _foodItemController = FoodItemController(
      foodItems: [
        FoodItem(name: "Apple", servingSize: '1 apple', calories: 122, fat: 0, protein: 0, carbohydrates: 30, sugar: 24.2, water: 0, caffeine: 0),
        FoodItem(name: "Scrambled Eggs", servingSize: '2 eggs', calories: 192, fat: 15.8, protein: 11.6, carbohydrates: 1, sugar: 0, water: 0, caffeine: 0),
      ]
  );
  final NutrientGraphController _nutrientGraphController = NutrientGraphController(
      nutrientData: [
        Tuple3<DateTime, double, HealthGoalAttribute>(DateTime(2024, 4, 4), 100, HealthGoalAttribute.protein),
        Tuple3<DateTime, double, HealthGoalAttribute>(DateTime(2024, 4, 2), 50, HealthGoalAttribute.carbs),
      ]
  );

  late List<Widget> _children;

  /// Constructor for _MyAppState
  _MyAppState() {
    _children = [
      ProfileScreen(controller: _personInfoController),
      HealthGoalScreen(controller: _personInfoController),
      HomeScreen(controller: _personInfoController),
      StatsOverviewScreen(controller: _personInfoController),
      LogScreen(controller: _personInfoController),
      StatsOverviewScreen(controller: _personInfoController)
    ];
  }
  //Old Nav Bar
  /*
      FoodItemView(controller: _foodItemController),
      FoodItemScreen(controller: _foodItemController),
      HealthGoalView(controller: _personInfoController),
      HealthGoalInputScreen(controller: _personInfoController),
      InputStatContainer(controller: _personInfoController),
      GoalProgressView(controller: _personInfoController),
      NutrientGraphView(controller: _nutrientGraphController),
      CalcBMIController(),
  */

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
          title: const Text('Git Healthy'),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Health Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Stats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Log',
            ),
          ],
        ),
      ),
    );
  }
}