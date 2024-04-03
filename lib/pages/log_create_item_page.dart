import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class LogCreateItemScreen extends StatefulWidget {
  PersonInfoController controller;
  LogCreateItemScreen({required this.controller});

  @override
  _LogCreateItemScreenState createState() => _LogCreateItemScreenState();
}

class _LogCreateItemScreenState extends State<LogCreateItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Placeholder( //Item Entry Placeholder
            //size of box
            fallbackHeight:150,
            fallbackWidth:10,
            //color of box
            color: Colors.black!,
          ),

          const SizedBox(height: 100), //Space between placeholders

          Placeholder( //Item Info Placeholder
            fallbackHeight:200, //size of box
            color: Colors.yellow!, //color of box
          ),
        ],
      ),
    );
  }
}