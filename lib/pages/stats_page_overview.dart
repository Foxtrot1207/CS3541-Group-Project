import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class StatsScreen extends StatefulWidget {
  PersonInfoController controller;
  StatsScreen({required this.controller});

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Placeholder( //Drop down bar and page display
            //size of box
            fallbackHeight:50,
            fallbackWidth:10,
            //color of box
            color: Colors.black!,
          ),

          const SizedBox(height: 100), //Space between placeholders

          Placeholder( //Tracked Item Placeholder
            fallbackHeight:200, //size of box
            color: Colors.red!, //color of box
          ),

          const SizedBox(height: 100), //Space between placeholders

          Placeholder( //Weekly Overview Placeholder
            fallbackHeight:200, //size of box
            color: Colors.green!, //color of box
          ),
        ],
      ),
    );
  }
}