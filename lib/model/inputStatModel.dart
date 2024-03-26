//import 'dart:html';

import 'package:firebase_database/firebase_database.dart';

class StatModel {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  Future<void> addStat(String calories, String nutrition) async {
    await _databaseReference.child("stats").push().set({
      "calories": calories,
      "nutrition": nutrition,
    });
  }

  Stream<DatabaseEvent> getStatsStream() {
    return _databaseReference.child("stats").onValue;
  }
}

