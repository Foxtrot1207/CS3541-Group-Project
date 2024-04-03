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
            //size of box
            fallbackHeight:200, // Specifies a fallback height
            //color of box
            color: Colors.black!, // Placeholder color
          ),
          SizedBox(height: 100), //Space between placeholders
          Placeholder( //Quick Add Placeholder
            //size of box
            fallbackHeight:350, // Specifies a fallback height
            //color of box
            color: Colors.red!, // Placeholder color
          ),
        ],
      ),
    );
  }
}