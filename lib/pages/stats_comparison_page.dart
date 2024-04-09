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
        Container(
        alignment: Alignment.center,
        child: Text('Comparison '),
          )
        ],
      ),
    );
  }
}