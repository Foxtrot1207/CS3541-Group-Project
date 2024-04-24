import 'dart:async';
import 'dart:developer';

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
  String formattedDate = DateFormat('yyyyMMdd').format(
      DateTime.now()); //DateFormat('yMd')
  /// A list of FoodItem objects managed by this controller.
  List<FoodItem> foodItems = [];
  NutritionTracker nutritonTracker = NutritionTracker();

  /// Creates a new FoodItemController with the given list of FoodItem objects.
  ///
  /// @param foodItems The initial list of FoodItem objects to manage.
  FoodItemController({required this.foodItems});

  /// Adds a new FoodItem to the "Food Catalog".
  ///
  /// @param foodItem The FoodItem to add.
  void createFoodItem(FoodItem foodItem) {
    FirebaseFirestore.instance
        .collection('Food Catalog')
        .doc(foodItem.name)
        .set(foodItem.toMap());
    foodItems.add(foodItem);
    notifyListeners();
  }

  void logFoodItem(Map<String, dynamic> foodItem, String selectedDate,
      int servings) {
    foodItem['servings'] = servings;
    calculateNutrientByServing(foodItem, servings);
    foodItem['date'] = selectedDate;

    nutritonTracker.logFood(FoodItem.fromMap(foodItem));

    FirebaseFirestore.instance
        .collection('Daily Logs')
        .doc(formattedDate)
        .collection('Food Items')
        .add(foodItem);
  }

  /// Removes a FoodItem from the list of food items managed by this controller.
  ///
  /// @param foodItem The FoodItem to remove.
  void removeFoodItem(FoodItem foodItem, String docId, selectedDate) {
    foodItems.remove(foodItem);
    nutritonTracker.removeFood(foodItem);
    FirebaseFirestore.instance
        .collection('Daily Logs')
        .doc(formattedDate)
        .collection('Food Items')
        .doc(docId)
        .delete();
    notifyListeners();
  }

  void calculateNutrientByServing(Map<String, dynamic> foodItem, int servings) {
    foodItem['calories'] *= servings;
    foodItem['protein_g'] *= servings;
    foodItem['fat_g'] *= servings;
    foodItem['carbohydrates_g'] *= servings;
    foodItem['sugar_g'] *= servings;
    foodItem['water_ml'] *= servings;
    foodItem['caffeine_mg'] *= servings;
  }


  void setLogDate(DateTime date) {
    formattedDate = DateFormat('yyyyMMdd').format(date);
    notifyListeners();
  }

  Stream<QuerySnapshot> getLog(String selectedDate) {
    return FirebaseFirestore.instance
        .collection('Daily Logs')
        .doc(formattedDate)
        .collection('Food Items')
        .snapshots();
  }

  Future<Map<String, double>> getNutritionDataForDate(DateTime date) async {
    try {
      String formattedDate = DateFormat('yyyyMMdd').format(date);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Daily Logs')
          .doc(formattedDate)
          .collection('Food Items')
          .get();

      double totalCalories = 0;
      double totalFat = 0;
      double totalProtein = 0;
      double totalCarbohydrates = 0;
      double totalSugar = 0;
      double totalWater = 0;
      double totalCaffeine = 0;

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        totalCalories += data['calories'];
        totalFat += data['fat_g'];
        totalProtein += data['protein_g'];
        totalCarbohydrates += data['carbohydrates_g'];
        totalSugar += data['sugar_g'];
        totalWater += data['water_ml'];
        totalCaffeine += data['caffeine_mg'];
      });

      Map<String, double> nutritionData = {
        'calories': totalCalories,
        'fat': totalFat,
        'protein': totalProtein,
        'carbohydrates': totalCarbohydrates,
        'sugar': totalSugar,
        'water': totalWater,
        'caffeine': totalCaffeine,
      };

      return nutritionData;
    } catch (error) {
      print('Error retrieving food items: $error');
      return {};
    }
  }


  Future<Map<String, double>> getNutritionDataForYesterday() async {
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    return getNutritionDataForDate(yesterday);
  }


}


