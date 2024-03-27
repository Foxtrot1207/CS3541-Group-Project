import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/notification_controller.dart';
import 'package:healthapp/app_notification_handler.dart';
import 'GoalList.dart';
import 'package:healthapp/view/food_screen.dart';
import 'package:healthapp/view/health_goal_view.dart';
import 'package:healthapp/view/food_item_view.dart';
import 'package:healthapp/model/food_item.dart';

String channelKey = AppNotificationHandler().getChannelKey();

void main() async {
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelGroupKey: channelKey,
          channelKey: "defaultChannel",
          channelName: "Goal Notifications",
          channelDescription: "Goal Notification Channel")
    ],
    channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: channelKey, channelGroupName: "Default Group"),
    ],
  );
  bool notificationsEnabled =
      await AwesomeNotifications().isNotificationAllowed();
  if (!notificationsEnabled) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionRecievedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
    super.initState();
  }

  int _currentIndex = 0;

  final List<Widget> _children = [
    //FoodItemView(),
    //HealthGoalView(),
    FoodItemView(
      foodItems: [
        FoodItem(name: "banana", calories: 100, macros: {} ),
        FoodItem(name: "apple", calories: 200, macros: {} ),
      ]
    ),
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



