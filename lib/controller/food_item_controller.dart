import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'package:healthapp/model/food_item.dart';
import 'package:healthapp/model/nutrition_tracker.dart';
import 'package:rxdart/rxdart.dart';

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
  void addFoodItem(FoodItem foodItem, String date) {
    foodItems.add(foodItem);
    FirebaseFirestore.instance
        .collection('Daily Logs')
        .doc(date)
        .collection('Food Items')
        .doc(foodItem.name)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        FirebaseFirestore.instance
            .collection('Daily Logs')
            .doc(date)
            .collection('Food Items')
            .doc(foodItem.name)
            .update(foodItem.toMap());
      } else {
        FirebaseFirestore.instance
            .collection('Daily Logs')
            .doc(date)
            .collection('Food Items')
            .doc(foodItem.name)
            .set(foodItem.toMap());
      }
    });
    foodItems.add(foodItem);
    notifyListeners();
  }

  void addFoodToLog(Map<String, dynamic> foodItem) {
    String formattedDate = DateFormat('yyyyMMdd').format(DateTime.now());
    String foodName = foodItem['name'];
    FirebaseFirestore.instance.collection('Daily Logs').doc(formattedDate).collection('Food Items').doc(foodName).set(foodItem);
  }

  /// Removes a FoodItem from the list of food items managed by this controller.
  ///
  /// @param foodItem The FoodItem to remove.
  void removeFoodItem(FoodItem foodItem) {
    foodItems.remove(foodItem);
    nutritonTracker.removeFood(foodItem);
    FirebaseFirestore.instance
        .collection('Daily Logs')
        .doc(formattedDate)
        .collection('Food Items')
        .doc(foodItem.name)
        .delete();
    notifyListeners();
  }


  Stream<List<QuerySnapshot>> getLog() {
    List<Stream<QuerySnapshot>> streams = [];
    for (int i = 0; i < 7; i++) {
      String formattedDate = DateFormat('yyyyMMdd').format(DateTime.now().subtract(Duration(days: i)));
      streams.add(FirebaseFirestore.instance.collection('Daily Logs').doc(formattedDate).collection('Food Items').snapshots());
    }
    return CombineLatestStream.list(streams);
  }
}