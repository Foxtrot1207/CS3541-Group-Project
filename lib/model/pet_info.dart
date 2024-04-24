

import 'package:flutter/material.dart';

class PetInfo {

  /// When the pet was last fed (user entered a log)
  late DateTime lastEatTime;

  /// Name of the pet
  final String name = "Ringo";

  PetInfo() {
    // By default, we'll leave things as being yesterday. Not retained data for now.
    lastEatTime = DateTime.now().subtract(const Duration(days: 1));
  }

}