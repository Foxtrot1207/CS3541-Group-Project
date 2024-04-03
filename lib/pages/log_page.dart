import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class LogScreen extends StatefulWidget {
  PersonInfoController controller;
  LogScreen({required this.controller});

  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Placeholder( //Food Log Placeholder
            fallbackHeight:500, //size of box
            color: Colors.black!, //color of box
          ),
        ],
      ),
    );
  }
}