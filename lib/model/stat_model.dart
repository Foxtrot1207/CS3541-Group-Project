
import 'package:firebase_database/firebase_database.dart';

class StatModel {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  Future<void> addStat(String day, String calories, String nutrition) async {
    await _databaseReference.child("stats").child(day).push().set({
      "calories": calories,
      "nutrition": nutrition,
    });
  }

  Stream<DatabaseEvent> getStatsStream(String date) {
    return _databaseReference.child("stats").onValue;
  }
}

