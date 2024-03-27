import 'package:flutter/material.dart';
import 'package:healthapp/controller/inputStatController.dart';

import 'package:healthapp/view/food_screen.dart';
import 'package:healthapp/view/health_goal_input.dart';
import 'package:healthapp/view/health_goal_view.dart';
import 'package:healthapp/view/food_item_view.dart';
import 'package:healthapp/view/inputStatView.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/model/food_item.dart';
import 'package:healthapp/model/person_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  // TODO: Remove this later!
  final FoodItemController _foodItemController =  FoodItemController(
     foodItems: [
      FoodItem(name: "banana", calories: 100, macros: {} ),
      FoodItem(name: "apple", calories: 200, macros: {} ),
     ]
  );
  
  late List<Widget> _children;

  _MyAppState() {
    _children = [
      FoodItemView(controller: _foodItemController),
      FoodItemScreen(controller: _foodItemController),
      HealthGoalView(controller: PersonInfoController(personInfo: PersonInfo())),
      HealthGoalInputScreen(),
      InputStatContainer(),
    ];
  }

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
          ],
        ),
      ),
    );
  }
}



