import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:healthapp/model/pet_info.dart';

class PetController extends ChangeNotifier {

  // Singleton
  PetController._privateConstructor();
  static final PetController instance = PetController._privateConstructor();
  
  PetInfo _pet = PetInfo();
  late PersonInfoController _person;
  late Timer _timer;

  /// Pet status variables.
  /// We don't store these in the model, as they are trivial to regenerate and do not need to be retained
  bool _playtime = false;
  bool _hungry   = true;
  bool _celebrate  = false;
  DateTime _celebrationEndTime = DateTime.now();
  bool isPlaytime()  { return _playtime; }
  bool isHungry()    { return _hungry;   }
  bool isCelebrating() { return _celebrate;  }

  void init(PersonInfoController personInfoController) {
    _person = personInfoController;

    // Run updateTick every 0.2 seconds
    _timer = Timer.periodic(Duration(milliseconds: 200), (Timer t) => updateTick());
  }

  void updateLogTime() {
    _pet.lastEatTime = DateTime.now();
  }

  String getName() {
    return _pet.name;
  }

  String getStatusText() {
    String state = "doing well";

    if(isHungry())
      state = "hungry";

    if(isCelebrating())
      state = "celebrating!";
    
    // if(isNight())
    //  state = "sleepy";
    
    if(isPlaytime())
      state = "playing";

    String name = getName();
    return "$name is $state";
  }

  double getWalkSpeed() {
    // Base speed is 2 to make the pet seem more lively
    double speed = 2.0;

    if(isHungry()) {
      // If we're hungry, we're always slower...
      speed *= 0.25;
    }

    if(isCelebrating()) {
      // Hit a goal? We're super excited!
      speed *= 4.0;
    }
    else if(isPlaytime()) {
      // Get a little hyper if we're playing
      speed *= 2.0;
    }

    return speed;
  }

  // Run any logic and notify listeners about results
  void updateTick() {
    var now = DateTime.now();

    // Set if the pet is playing or not
    var tsec = now.millisecondsSinceEpoch / 1000.0;
    bool playtime = (tsec / 2.0).round() % 7 == 1;

    // Check if the pet is hungry or not
    var foodDT = now.difference(_pet.lastEatTime);
    bool hungry = foodDT.inHours > _person.personInfo.eatReminderHours;

    // Decay our celebrations
    bool celebrate = _celebrate;
    if(celebrate && now.isAfter(_celebrationEndTime)) {
      celebrate = false;
    }

    // Check if any goals have been hit
    if(!celebrate) {
      for(int i = 0; i < _person.getHealthGoalCount(); i++) {
        HealthGoal goal =_person.getHealthGoalAt(i);
        if(goal.achievedAt == null && _person.isHealthGoalComplete(goal)) {

          // Hit a goal! Celebrate it for 10 seconds
          goal.achievedAt = now;
          celebrate = true;
          _celebrationEndTime = now.add(Duration(seconds: 10));
          break;
        }
      }
    }

    // Check for changes. We don't want to spam notifyListeners
    if(playtime != _playtime || hungry != _hungry || celebrate != _celebrate) {
      // Something changed, update our state and notify the listeners
      _playtime = playtime;
      _hungry = hungry;
      _celebrate = celebrate;
      notifyListeners();
    }
  }
}
