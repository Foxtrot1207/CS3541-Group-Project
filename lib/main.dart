import 'package:flutter/material.dart';
import 'lib/view/food_screen.dart';
import 'lib/view/health_goal_view.dart';
import 'lib/view/food_item_view.dart';


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
    FoodItemScreen(),
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
          items: const [
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
  const FoodItemView({super.key});

  @override
  _FoodItemScreenState createState() => _FoodItemScreenState();
}

class _FoodItemViewState extends State<FoodItemView> {

}

class HealthGoalView extends StatefulWidget {
  @override
  _HealthGoalViewState createState() => _HealthGoalViewState();
}

class _HealthGoalViewState extends State<HealthGoalView> {

}

class FoodItemScreen extends StatefulWidget {
  @override
  _FoodItemScreenState createState() => _FoodItemScreenState();
}

class _FoodItemScreenState extends State<FoodItemScreen> {

}
