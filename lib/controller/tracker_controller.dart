import 'package:healthapp/model/tracker_item.dart';

class TrackerController {
  List<Tracker> trackers; // A list of all trackers

  TrackerController({required this.trackers});

  // Method to add a new tracker
  void addTracker(String type) {
    trackers.add(Tracker(type: type, double dailyAmount, double weeklyAmount));
  }

  // Method to remove a tracker
  void removeTracker(String type) {
    trackers.removeWhere((tracker) => tracker.type == type);
  }

  // Method to update the amount of a tracked item
  void updateTracker(String type, double dailyAmount, double weeklyAmount) {
    // Find the tracker and update the amounts
    for (var tracker in trackers) {
      if (tracker.type == type) {
        tracker.updateDailyAmount(dailyAmount);
        tracker.updateWeeklyAmount(weeklyAmount);
      }
    }
  }
}
