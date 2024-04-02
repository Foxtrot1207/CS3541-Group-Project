import 'package:firebase_database/firebase_database.dart';

/// Represents a model for handling statistics in the app.
///
/// This model provides methods for adding statistics and getting a stream of statistics from the Firebase database.
class StatModel {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  /// Adds a new statistic to the Firebase database.
  ///
  /// @param day The day for which the statistic is being added.
  /// @param calories The number of calories consumed on the day.
  /// @param nutrition The nutritional content consumed on the day.
  /// @return A Future that completes when the statistic has been added to the database.
  Future<void> addStat(String day, String calories, String nutrition) async {
    await _databaseReference.child("stats").child(day).push().set({
      "calories": calories,
      "nutrition": nutrition,
    });
  }

  /// Returns a stream of database events for the statistics of a specific date.
  ///
  /// @param date The date for which the statistics stream is required.
  /// @return A Stream of DatabaseEvent objects representing the changes to the statistics for the specified date.
  Stream<DatabaseEvent> getStatsStream(String date) {
    return _databaseReference.child("stats").onValue;
  }
}
