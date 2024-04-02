import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/model/health_goal.dart';
import 'package:healthapp/model/person_info.dart';

import 'package:healthapp/model/stat_model.dart';
import 'package:healthapp/view/stat_input_view.dart';

/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("couldn't connect");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Input Stat',
            theme: ThemeData(
              primarySwatch: Colors.brown,
            ),
            home: InputStatContainer(),
          );
        }
        return MaterialApp();
      },
    );
  }
}
*/


class InputStatContainer extends StatelessWidget {
  final PersonInfoController controller;
  const InputStatContainer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InputStatView(
      title: 'Input Stat about My Food',
      addStatCallback: (String day, HealthGoalAttribute attribute, double nutrition) {
        // StatModel().addStat(day, calories, nutrition);
        // TODO: Remove this later
        controller.addStat(attribute, nutrition);
      },
    );
  }
}