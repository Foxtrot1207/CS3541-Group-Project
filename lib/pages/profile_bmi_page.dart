import 'package:flutter/material.dart';
import 'package:healthapp/bmi_calc_view.dart';
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
          CalcBMIController()
        ],
      ),
    );
  }
}