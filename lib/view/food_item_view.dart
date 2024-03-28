import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';

import 'package:healthapp/model/food_item.dart';


class FoodItemView extends StatelessWidget {
  final FoodItemController controller;

  FoodItemView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.foodItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(controller.foodItems[index].name),
          subtitle: Text('Calories: ${controller.foodItems[index].calories}'),
        );
      },
    );
  }
}
