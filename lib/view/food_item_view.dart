import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';

import 'package:healthapp/model/food_item.dart';

/// A widget that displays a list of food items.
///
/// This widget takes a [FoodItemController] as a parameter and uses it to build a list of food items.
class FoodItemView extends StatelessWidget {
  /// The controller that provides the food items to display.
  final FoodItemController controller;

  /// Creates a new FoodItemView.
  ///
  /// The [controller] parameter must not be null.
  FoodItemView({required this.controller});

  /// Builds the widget tree.
  ///
  /// This method is called by the framework when it asks this widget to build.
  /// It returns a [ListView] that displays the food items provided by the [controller].
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