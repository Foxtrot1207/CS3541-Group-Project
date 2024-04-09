import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class HomeScreen extends StatefulWidget {
  PersonInfoController controller;
  HomeScreen({required this.controller});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Placeholder( //Health Goals Placeholder
            fallbackHeight:200, //size of box
            color: Colors.black!, //color of box
          ),

          SizedBox(height: 100), //Space between placeholders

          Placeholder( //Quick Add Placeholder
            fallbackHeight:350,  //size of box
            color: Colors.red!,  //color of box
          ),
        ],
      ),
    );
  }
}