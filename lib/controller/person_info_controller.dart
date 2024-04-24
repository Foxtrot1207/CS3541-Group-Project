import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/model/food_item.dart';
import 'package:healthapp/model/person_info.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/pages/profile_bmi_page.dart';
import 'package:intl/intl.dart';

/// Controller for managing person's health information and goals.
class PersonInfoController extends ChangeNotifier {
  PersonInfo personInfo;
  FoodItem _foodIntakeToday = FoodItem(name: "", serving_size: "");

  /// Constructor for PersonInfoController.
  ///
  /// Requires [personInfo] as a parameter.
  PersonInfoController({required this.personInfo})
  {
    var today = DateFormat('yyyyMMdd').format(DateTime.now());

    FirebaseFirestore.instance
      .collection('Daily Logs')
      .doc(today)
      .collection('Food Items')
      .snapshots()
      .listen((event) {
        FoodItem aggregate = FoodItem(name: "", serving_size: "");
        for (var doc in event.docs) {
          aggregate = aggregate + FoodItem.fromMap(doc.data());
        }
        _foodIntakeToday = aggregate;
        
        notifyListeners();
      });
  }


  /// Returns the count of current health goals.
  int getHealthGoalCount() {
    return personInfo.currentGoals.length;
  }

  /// Returns the health goal at a particular [index].
  HealthGoal getHealthGoalAt(int index) {
    return personInfo.currentGoals[index];
  }

  /// Adds a [goal] to the current health goals.
  void addHealthGoal(HealthGoal goal) {
    personInfo.currentGoals.add(goal);
    notifyListeners();
  }

  /// Removes a [goal] from the current health goals.
  void removeHealthGoal(HealthGoal goal) {
    personInfo.currentGoals.remove(goal);
    notifyListeners();
  }

  /// Removes a health goal at a particular [index].
  void removeHealthGoalAt(int index) {
    personInfo.currentGoals.removeAt(index);
    notifyListeners();
  }

  /// Returns the stat for a particular [goal].
  double getHeathGoalProgress(HealthGoal goal) {
    if(goal.cadence != HealthGoalCadence.daily)
      return -1;
    
    switch(goal.attribute)
    {
      case HealthGoalAttribute.calories:
        return _foodIntakeToday.calories;
      case HealthGoalAttribute.protein:
        return _foodIntakeToday.protein_g;
      case HealthGoalAttribute.fat:
        return _foodIntakeToday.fat_g;
      case HealthGoalAttribute.carbs:
        return _foodIntakeToday.carbohydrates_g;
      case HealthGoalAttribute.sugar:
        return _foodIntakeToday.sugar_g;
      case HealthGoalAttribute.water:
        return _foodIntakeToday.water_ml;
      case HealthGoalAttribute.caffeine:
        return _foodIntakeToday.caffeine_mg;
      default:
        break;
    }
  //  return personInfo.currentAttributes[attribute]??0;
    return -1;
  }

  /// Returns true if a [goal] is completed.
  bool isHealthGoalComplete(HealthGoal goal) {
    return getHeathGoalProgress(goal) > goal.target;
  }

  /// Adds a [value] to the stat for a particular [attribute].
  void addStat(HealthGoalAttribute attribute, double value) {

    // Redirect into DB for now.
    FoodItem item = FoodItem(name: "Manual Entry", serving_size: "1");
    switch(attribute)
    {
      case HealthGoalAttribute.calories:
        item.calories = value;
        break;
      case HealthGoalAttribute.protein:
        item.protein_g = value;
        break;
      case HealthGoalAttribute.fat:
        item.fat_g = value;
        break;
      case HealthGoalAttribute.carbs:
        item.carbohydrates_g = value;
        break;
      case HealthGoalAttribute.sugar:
        item.sugar_g = value;
        break;
      case HealthGoalAttribute.water:
        item.water_ml = value;
        break;
      case HealthGoalAttribute.caffeine:
        item.caffeine_mg = value;
        break;
    }

    // NOTE: This should be moved into part of food item controller
    var date = DateFormat('yyyyMMdd').format(DateTime.now());
    var foodItem = item.toMap();
    foodItem['date'] = date;
    foodItem['servings'] = 1;
    FirebaseFirestore.instance
        .collection('Daily Logs')
        .doc(date)
        .collection('Food Items')
        .add(foodItem);

    notifyListeners();
  }

  ///Holds last calculated BMI
  int LastBMI() {
    return personInfo.lastBMI;
  }

///Holds last inputted weight
  int LastWeight(){
    return personInfo.lastWeight;
  }

///updates BMI and Weight on profile screen
  void updateLastBMIAndWeight(int bmi, int weight) {
    personInfo.lastBMI = bmi;
    personInfo.lastWeight = weight;
    notifyListeners();
  }

}



