import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class StatsGraphScreen extends StatefulWidget {
  PersonInfoController controller;
  StatsGraphScreen({required this.controller});

  @override
  _StatsGraphScreenState createState() => _StatsGraphScreenState();
}

class _StatsGraphScreenState extends State<StatsGraphScreen> {
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

          Placeholder( //Graph 1 Placeholder
            fallbackHeight:200, //size of box
            color: Colors.red!, //color of box
          ),

          const SizedBox(height: 100), //Space between placeholders

          Placeholder( //Graph 2 Placeholder
            fallbackHeight:200, //size of box
            color: Colors.green!, //color of box
          ),
        ],
      ),
    );
  }
}