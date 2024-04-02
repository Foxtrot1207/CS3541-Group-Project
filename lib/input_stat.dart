import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/model/person_info.dart';
import 'controller/stat_input_controller.dart';

/// A widget that initializes the Firebase app and builds the main app.
class AppInitializer extends StatelessWidget {
  /// Initializes the Firebase app.
  ///
  /// Returns a [Future] that completes when the app is initialized.
  Future<FirebaseApp> initializeFirebase() async {
    return await Firebase.initializeApp();
  }

  /// Builds the widget tree for this widget.
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

/// The main app widget.
class MyApp extends StatelessWidget {
  /// Builds the widget tree for this widget.
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