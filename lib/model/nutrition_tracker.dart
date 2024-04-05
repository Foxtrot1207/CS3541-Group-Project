import 'package:healthapp/model/food_item.dart';


class NutritionTracker {
  Map<String, double> dailyValues = {};
  Map<String, double> weeklyValues = {};

  void logFood(FoodItem food) {
    ///Calories
    dailyValues['calories'] = (dailyValues['calories'] ?? 0) + food.calories;
    weeklyValues['calories'] = (weeklyValues['calories'] ?? 0) + food.calories;
    ///Fat
    dailyValues['fat'] = (dailyValues['fat'] ?? 0) + food.fat;
    weeklyValues['fat'] = (weeklyValues['fat'] ?? 0) + food.fat;
    ///Carbs
    dailyValues['carbohydrates'] = (dailyValues['carbohydrates'] ?? 0) + food.carbohydrates;
    weeklyValues['carbohydrates'] = (weeklyValues['carbohydrates'] ?? 0) + food.carbohydrates;
    ///Protein
    dailyValues['protein'] = (dailyValues['protein'] ?? 0) + food.protein;
    weeklyValues['protein'] = (weeklyValues['protein'] ?? 0) + food.protein;
    ///Sugar
    dailyValues['sugar'] = (dailyValues['sugar'] ?? 0) + food.sugar;
    weeklyValues['sugar'] = (weeklyValues['sugar'] ?? 0) + food.sugar;
    ///Caffeine
    dailyValues['caffeine'] = (dailyValues['caffeine'] ?? 0) + food.caffeine;
    weeklyValues['caffeine'] = (weeklyValues['caffeine'] ?? 0) + food.caffeine;
    ///Water
    dailyValues['water'] = (dailyValues['water'] ?? 0) + food.water;
    weeklyValues['water'] = (weeklyValues['water'] ?? 0) + food.water;
  }

  void removeFood(FoodItem food) {
    ///Calories
    dailyValues['calories'] = (dailyValues['calories'] ?? 0) - food.calories;
    weeklyValues['calories'] = (weeklyValues['calories'] ?? 0) - food.calories;
    ///Fat
    dailyValues['fat'] = (dailyValues['fat'] ?? 0) - food.fat;
    weeklyValues['fat'] = (weeklyValues['fat'] ?? 0) - food.fat;
    ///Carbs
    dailyValues['carbohydrates'] = (dailyValues['carbohydrates'] ?? 0) - food.carbohydrates;
    weeklyValues['carbohydrates'] = (weeklyValues['carbohydrates'] ?? 0) - food.carbohydrates;
    ///Protein
    dailyValues['protein'] = (dailyValues['protein'] ?? 0) - food.protein;
    weeklyValues['protein'] = (weeklyValues['protein'] ?? 0) - food.protein;
    ///Sugar
    dailyValues['sugar'] = (dailyValues['sugar'] ?? 0) - food.sugar;
    weeklyValues['sugar'] = (weeklyValues['sugar'] ?? 0) - food.sugar;
    ///Caffeine
    dailyValues['caffeine'] = (dailyValues['caffeine'] ?? 0) - food.caffeine;
    weeklyValues['caffeine'] = (weeklyValues['caffeine'] ?? 0) - food.caffeine;
    ///Water
    dailyValues['water'] = (dailyValues['water'] ?? 0) - food.water;
    weeklyValues['water'] = (weeklyValues['water'] ?? 0) - food.water;
  }

  void resetDaily() {
    dailyValues.clear();
  }

  void resetWeekly() {
    weeklyValues.clear();
  }
}