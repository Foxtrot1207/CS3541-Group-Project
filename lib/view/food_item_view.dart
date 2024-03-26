import 'package:flutter/material.dart';

import 'package:healthapp/lib/model/food_item.dart';


class FoodItemView extends StatelessWidget {
  final List<FoodItem> foodItems;

  FoodItemView({required this.foodItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(foodItems[index].name),
          subtitle: Text('Calories: ${foodItems[index].calories}'),
        );
      },
    );
  }
}
