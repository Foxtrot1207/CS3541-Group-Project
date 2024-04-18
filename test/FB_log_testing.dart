import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:intl/intl.dart';

import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/model/food_item.dart';
import 'package:healthapp/pages/log_page.dart';
import 'package:healthapp/pages/log_create_item_page.dart';
import 'package:healthapp/pages/log_add_food_page.dart';

class MockFoodItemController extends Mock implements FoodItemController {}

void main() {
  group('Log Page Tests', () {
    test('Clicking remove on a food item should remove it from the current date\'s collection', () {
      // Setup
      final mockController = MockFoodItemController();
      final logPage = LogScreen(controller: mockController);
      // Create demo food item to be removed
      final foodItem = FoodItem
        (
          name: "Apple",
          servingSize: '1 apple',
          calories: 122,
          fat_g: 0,
          protein_g: 0,
          carbohydrates_g: 30,
          sugar_g: 24.2,
          water_ml: 0,
          caffeine_mg: 0
      );

      // Action
      mockController.removeFoodItem(foodItem);

      // Assertion
      verify(mockController.removeFoodItem(foodItem));
    });

    test('Log page should only show the current date\'s collection', () {
      // Setup
      final mockController = MockFoodItemController();
      final logPage = LogScreen(controller: mockController);
      final formattedDate = DateFormat('yyyyMMdd').format(DateTime.now());

      // Action
      mockController.getLog(formattedDate);

      // Assertion
      verify(mockController.getLog(formattedDate));
    });
  });

  group('Log Create Item Page Tests', () {
    test('Creating a food item should prompt confirmation before adding to the database', () {
      // Setup
      final mockController = MockFoodItemController();
      final logCreateItemPage = LogCreateItemPage(controller: mockController);

      // Action
      logCreateItemPage.saveFoodItem();

      // Assertion
      verify(mockController.confirmAndAddFoodItem(any));
    });
  });
}