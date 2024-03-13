import 'package:flutter/material.dart';
import 'food_item_dao.dart';
import 'food_item_view.dart';

class FoodItemController with ChangeNotifier {
  final FoodItemDAO _foodItemDAO = FoodItemDAO();
  List<FoodItem> _foodItems = [];

  List<FoodItem> get foodItems => _foodItems;

  Future<void> fetchFoodItems() async {
    _foodItems = await _foodItemDAO.getFoodItems();
    notifyListeners();
  }
}
