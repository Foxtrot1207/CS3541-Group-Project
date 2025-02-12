import 'package:flutter/material.dart';
import 'package:healthapp/view/bmi_calc_view.dart';
import 'package:healthapp/controller/person_info_controller.dart';

class ProfileBMIScreen extends StatefulWidget {
  PersonInfoController controller;
  ProfileBMIScreen({required this.controller});

  @override
  _ProfileBMIScreenState createState() => _ProfileBMIScreenState();
}

class _ProfileBMIScreenState extends State<ProfileBMIScreen> {

  //Function to update last BMI and weight
  void handleBMIUpdated(double bmi, double weight) {
    widget.controller.updateLastBMIAndWeight(bmi.round(), weight.round());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //BMI controller with update function call
          CalcBMIController(onBMIUpdated: handleBMIUpdated)
        ],
      ),
    );
  }
}