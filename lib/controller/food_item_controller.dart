//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/model/food_item.dart';
import 'package:healthapp/model/nutrition_tracker.dart';

/// A controller for managing a list of FoodItem objects.
///
/// This controller is designed to be used with Flutter's ChangeNotifierProvider for state management.
class FoodItemController with ChangeNotifier {
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
  void addFoodItem(FoodItem foodItem, String date) {
    foodItems.add(foodItem);
    FirebaseFirestore.instance
        .collection('Daily Logs')
        .doc(date)
        .collection('Food Items')
        .add(foodItem.toMap());
    nutritonTracker.logFood(foodItem);
    notifyListeners();
  }

  /// Removes a FoodItem from the list of food items managed by this controller.
  ///
  /// @param foodItem The FoodItem to remove.
  void removeFoodItem(FoodItem foodItem) {
    foodItems.remove(foodItem);
    nutritonTracker.removeFood(foodItem);
    notifyListeners();
  }
}