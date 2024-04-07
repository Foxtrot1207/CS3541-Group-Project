import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class StatsGraphScreen extends StatefulWidget {
  PersonInfoController controller;
  StatsGraphScreen({required this.controller});

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsGraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
        Container(
        alignment: Alignment.center,
        child: Text('Graph'),
          )
        ],
      ),
    );
  }
}

