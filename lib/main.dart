import 'package:flutter/material.dart';
import 'package:healthapp/controller/stat_input_controller.dart';
import 'package:healthapp/pages/health_goal_page.dart';
import 'package:healthapp/pages/home_page.dart';
import 'package:healthapp/pages/log_page.dart';
import 'package:healthapp/pages/profile_page.dart';
import 'package:healthapp/pages/stats_page_overview.dart';

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

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 2;

  // TODO: Remove these two later!
  PersonInfoController _personInfoController = PersonInfoController(
      personInfo: PersonInfo()
  );
  final FoodItemController _foodItemController = FoodItemController(
      foodItems: [
        FoodItem(name: "Banana", calories: 105, servingSize: 1, macros: {} ),
        FoodItem(name: "Apple", calories: 95, servingSize: 2, macros: {} ),
      ]
  );

  late List<Widget> _children;

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
      CalcBMIController(),
  */

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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