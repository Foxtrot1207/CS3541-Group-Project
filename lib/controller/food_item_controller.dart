import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/lib/model/food_item.dart';

class FoodItemController with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  List<FoodItem> _foodItems = [];

  List<FoodItem> get foodItems => _foodItems;

  Future<void> addFoodItem(FoodItem foodItem) async {
    await _db.collection('foodItems').add(foodItem.toMap());
    fetchFoodItems(); // Refresh the list after adding a new item
  }

  Future<List<FoodItem>> getFoodItems() async {
    QuerySnapshot querySnapshot = await _db.collection('foodItems').get();
    _foodItems = querySnapshot.docs.map((doc) => FoodItem.fromMap(doc.data())).toList();
    notifyListeners();
    return _foodItems;
  }


  Future<void> deleteFoodItem(String id) async {
    await _db.collection('foodItems').doc(id).delete();
    fetchFoodItems(); // Refresh the list after deleting an item
  }

  Future<void> fetchFoodItems() async {
    _foodItems = await getFoodItems();
    notifyListeners();
  }
}
