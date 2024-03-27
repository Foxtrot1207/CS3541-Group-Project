import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../model/inputStatModel.dart';
import '../view/inputStatView.dart';

void main() {
  runApp(const MyApp());
}

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
            home: MyHomePageContainer(),
          );
        }
        return MaterialApp();
      },
    );
  }
}


class MyHomePageContainer extends StatelessWidget {
  const MyHomePageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage(
      title: 'Input Stat about My Food',
      addStatCallback: (String day, String calories, String nutrition) {
        StatModel().addStat(day, calories, nutrition);
      },
    );
  }
}