import 'package:flutter/material.dart';
import 'food_screen.dart';
import 'health_goal_view.dart';
import 'food_item_view.dart'; // Assuming you have a screen for inputting food items


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FoodItemView(),
    HealthGoalView(),
    FoodItemScreen(), // Placeholder for the food item input screen
  ];

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
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Food Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Health Goals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              label: 'Add Food',
            ),
          ],
        ),
      ),
    );
  }
}

class FoodItemView extends StatefulWidget {
  @override
  _FoodItemScreenState createState() => _FoodItemScreenState();
}

class _FoodItemViewState extends State<FoodItemView> {
  // Implementation of FoodItemView
}

class HealthGoalView extends StatefulWidget {
  @override
  _HealthGoalViewState createState() => _HealthGoalViewState();
}

class _HealthGoalViewState extends State<HealthGoalView> {
  // Implementation of HealthGoalView
}

class FoodItemScreen extends StatefulWidget {
  @override
  _FoodItemScreenState createState() => _FoodItemScreenState();
}

class _FoodItemScreenState extends State<FoodItemScreen> {
  // Placeholder implementation for FoodItemScreen
}
