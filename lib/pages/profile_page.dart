import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class ProfileScreen extends StatefulWidget {
  PersonInfoController controller;
  ProfileScreen({required this.controller});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Placeholder( //User info
            //size of box
            fallbackHeight:100,
            fallbackWidth:10,
            //color of box
            color: Colors.blue!,
          ),

          const SizedBox(height: 100), //Space between placeholders

          Placeholder( //BMI and Weight
            fallbackHeight:200, //size of box
            color: Colors.red!, //color of box
          ),

          const SizedBox(height: 100), //Space between placeholders

          Placeholder( //Resource List
            fallbackHeight:150, //size of box
            color: Colors.green!, //color of box
          ),
        ],
      ),
    );
  }
}