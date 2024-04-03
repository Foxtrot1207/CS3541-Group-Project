import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class StatsComparisonScreen extends StatefulWidget {
  PersonInfoController controller;
  StatsComparisonScreen({required this.controller});

  @override
  _StatsComparisonScreenState createState() => _StatsComparisonScreenState();
}

class _StatsComparisonScreenState extends State<StatsComparisonScreen> {
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

          Placeholder( // Placeholder
            fallbackHeight:400, //size of box
            color: Colors.red!, //color of box
          ),
        ],
      ),
    );
  }
}