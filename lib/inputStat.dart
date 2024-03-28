import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/model/person_info.dart';
import 'controller/inputStatController.dart';

/*
void main() {
  runApp(AppInitializer());
}
*/

class AppInitializer extends StatelessWidget {
  Future<FirebaseApp> initializeFirebase() async {
    return await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                'Error initializing Firebase. Please check your network connection and try again.',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
        // Otherwise, show a loading indicator
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Stat',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: InputStatContainer(controller: PersonInfoController(personInfo: PersonInfo())),
    );
  }
}

