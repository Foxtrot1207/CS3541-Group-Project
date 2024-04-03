

class Tracker {
  String type; // The type of item being tracked (e.g., alcohol, caffeine, etc.)
  double dailyAmount; // The cumulative amount consumed daily
  double weeklyAmount; // The cumulative amount consumed weekly

  Tracker({required this.type, this.dailyAmount = 0.0, this.weeklyAmount = 0.0});

  // You might want to add methods to update the daily and weekly amounts
  void updateDailyAmount(double /*serving amount*/) {
    dailyAmount += /*serving amount*/;
  }

  void updateWeeklyAmount(double /*serving amount*/) {
    weeklyAmount += /*serving amount*/;
  }
}