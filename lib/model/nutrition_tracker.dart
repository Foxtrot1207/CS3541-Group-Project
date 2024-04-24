import 'package:healthapp/model/food_item.dart';


class NutritionTracker {
  Map<String, double> dailyValues = {};
  Map<String, double> weeklyValues = {};



  void logFood(FoodItem food) {
    ///Calories
    dailyValues['calories'] = (dailyValues['calories'] ?? 0) + food.calories;
    weeklyValues['calories'] = (weeklyValues['calories'] ?? 0) + food.calories;
    ///Fat
    dailyValues['fat'] = (dailyValues['fat'] ?? 0) + food.fat_g;
    weeklyValues['fat'] = (weeklyValues['fat'] ?? 0) + food.fat_g;
    ///Carbs
    dailyValues['carbohydrates'] = (dailyValues['carbohydrates'] ?? 0) + food.carbohydrates_g;
    weeklyValues['carbohydrates'] = (weeklyValues['carbohydrates'] ?? 0) + food.carbohydrates_g;
    ///Protein
    dailyValues['protein'] = (dailyValues['protein'] ?? 0) + food.protein_g;
    weeklyValues['protein'] = (weeklyValues['protein'] ?? 0) + food.protein_g;
    ///Sugar
    dailyValues['sugar'] = (dailyValues['sugar'] ?? 0) + food.sugar_g;
    weeklyValues['sugar'] = (weeklyValues['sugar'] ?? 0) + food.sugar_g;
    ///Caffeine
    dailyValues['caffeine'] = (dailyValues['caffeine'] ?? 0) + food.caffeine_mg;
    weeklyValues['caffeine'] = (weeklyValues['caffeine'] ?? 0) + food.caffeine_mg;
    ///Water
    dailyValues['water'] = (dailyValues['water'] ?? 0) + food.water_ml;
    weeklyValues['water'] = (weeklyValues['water'] ?? 0) + food.water_ml;
  }

  void removeFood(FoodItem food) {
    ///Calories
    dailyValues['calories'] = (dailyValues['calories'] ?? 0) - food.calories;
    weeklyValues['calories'] = (weeklyValues['calories'] ?? 0) - food.calories;
    ///Fat
    dailyValues['fat'] = (dailyValues['fat'] ?? 0) - food.fat_g;
    weeklyValues['fat'] = (weeklyValues['fat'] ?? 0) - food.fat_g;
    ///Carbs
    dailyValues['carbohydrates'] = (dailyValues['carbohydrates'] ?? 0) - food.carbohydrates_g;
    weeklyValues['carbohydrates'] = (weeklyValues['carbohydrates'] ?? 0) - food.carbohydrates_g;
    ///Protein
    dailyValues['protein'] = (dailyValues['protein'] ?? 0) - food.protein_g;
    weeklyValues['protein'] = (weeklyValues['protein'] ?? 0) - food.protein_g;
    ///Sugar
    dailyValues['sugar'] = (dailyValues['sugar'] ?? 0) - food.sugar_g;
    weeklyValues['sugar'] = (weeklyValues['sugar'] ?? 0) - food.sugar_g;
    ///Caffeine
    dailyValues['caffeine'] = (dailyValues['caffeine'] ?? 0) - food.caffeine_mg;
    weeklyValues['caffeine'] = (weeklyValues['caffeine'] ?? 0) - food.caffeine_mg;
    ///Water
    dailyValues['water'] = (dailyValues['water'] ?? 0) - food.water_ml;
    weeklyValues['water'] = (weeklyValues['water'] ?? 0) - food.water_ml;
  }


  Map<String, double> getDailyTotals() {
    Map<String, double> dailyTotals = {};
    dailyValues.forEach((key, value) {
      dailyTotals[key] = value ?? 0.0;
    });
    return dailyTotals;
  }

  Map<String, double> getWeeklyTotals() {
    Map<String, double> weeklyTotals = {};
    weeklyValues.forEach((key, value) {
      weeklyTotals[key] = value ?? 0.0;
    });
    return weeklyTotals;
  }

  void resetDaily() {
    dailyValues.clear();
  }

  void resetWeekly() {
    weeklyValues.clear();
  }
}