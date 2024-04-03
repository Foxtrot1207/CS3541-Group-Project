import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class ProfileBMIScreen extends StatefulWidget {
  PersonInfoController controller;
  ProfileBMIScreen({required this.controller});

  @override
  _ProfileBMIScreenState createState() => _ProfileBMIScreenState();
}

class _ProfileBMIScreenState extends State<ProfileBMIScreen> {
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

          Placeholder( //BMI Calc
            fallbackHeight:400, //size of box
            color: Colors.red!, //color of box
          ),
        ],
      ),
    );
  }
}