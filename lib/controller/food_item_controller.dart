import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:healthapp/model/food_item.dart';
import 'package:healthapp/model/nutrition_tracker.dart';

/// A controller for managing a list of FoodItem objects.
///
/// This controller is designed to be used with Flutter's ChangeNotifierProvider for state management.
class FoodItemController with ChangeNotifier {
  String formattedDate = DateFormat.yMd().format(DateTime.now()); //DateFormat('yMd')
  /// A list of FoodItem objects managed by this controller.
  List<FoodItem> foodItems;
  NutritionTracker nutritonTracker = NutritionTracker();

  /// Creates a new FoodItemController with the given list of FoodItem objects.
  ///
  /// @param foodItems The initial list of FoodItem objects to manage.
  FoodItemController({required this.foodItems});

  /// Adds a new FoodItem to the list of food items managed by this controller.
  ///
  /// @param foodItem The FoodItem to add.
  void addFoodItem(FoodItem foodItem) {
    (foodItem.toMap());
    nutritonTracker.logFood(foodItem);
    notifyListeners();
  }

  void addFoodToLog(Map<String, dynamic> foodItem) {
    String formattedDate = DateFormat.yMd().format(DateTime.now());
    FirebaseFirestore.instance.collection('/user_log/$formattedDate').add(foodItem);
  }

  /// Removes a FoodItem from the list of food items managed by this controller.
  ///
  /// @param foodItem The FoodItem to remove.
  void removeFoodItem(FoodItem foodItem) {
    foodItems.remove(foodItem);
    nutritonTracker.removeFood(foodItem);
    notifyListeners();
  }


  Stream<QuerySnapshot> getLog() {
    String formattedDate = DateFormat.yMd().format(DateTime.now());
    return FirebaseFirestore.instance.collection('/user_log/$formattedDate').snapshots();
  }
}