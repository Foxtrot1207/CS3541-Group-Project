import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/model/food_item.dart';
import 'package:healthapp/pages/log_page.dart';
import 'package:healthapp/pages/log_create_item_page.dart';
import 'package:healthapp/pages/log_add_food_page.dart';

class MockFoodItemController extends Mock implements FoodItemController {}

void main() {
  group('Log Add Food Page Tests', () {
    test('Clicking add on a food item should create a daily log collection if not exist', () {
      // Setup
      final mockController = MockFoodItemController();
      final logAddFoodPage = LogAddFoodPage(controller: mockController);

      // Action
      logAddFoodPage.addFoodItem();

      // Assertion
      verify(mockController.createOrUpdateDailyLog(any));
    });
  });

  group('Log Page Tests', () {
    test('Clicking remove on a food item should remove it from the current date\'s collection', () {
      // Setup
      final mockController = MockFoodItemController();
      final logPage = LogPage(controller: mockController);

      // Action
      logPage.removeFoodItem();

      // Assertion
      verify(mockController.removeFoodItem(any));
    });

    test('Log page should only show the current date\'s collection', () {
      // Setup
      final mockController = MockFoodItemController();
      final logPage = LogPage(controller: mockController);
      final formattedDate = DateFormat('yyyyMMdd').format(DateTime.now());

      // Action
      logPage.fetchLog();

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