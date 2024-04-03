import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class LogAddFoodScreen extends StatefulWidget {
  PersonInfoController controller;
  LogAddFoodScreen({required this.controller});

  @override
  _LogAddFoodScreenState createState() => _LogAddFoodScreenState();
}

class _LogAddFoodScreenState extends State<LogAddFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Placeholder( //Menu Button Placeholder
            //size of box
            fallbackHeight:50,
            fallbackWidth:10,
            //color of box
            color: Colors.black!,
          ),

          const SizedBox(height: 100), //Space between placeholders

          Placeholder( //Saved Item Placeholder
            fallbackHeight:400, //size of box
            color: Colors.yellow!, //color of box
          ),
        ],
      ),
    );
  }
}