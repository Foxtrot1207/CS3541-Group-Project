import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/controller/pet_controller.dart';
import 'package:healthapp/pages/base_page.dart';
import 'package:healthapp/view/pet_status.dart';
import 'package:healthapp/view/pet_widget.dart';
import 'package:healthapp/view/progress_widget.dart';

class HomeScreen extends BaseStatefulPage {
  PersonInfoController controller;
  HomeScreen({required this.controller});

  @override
  _HomeScreenState createState() => _HomeScreenState();

  
  @override
  void activatePage() {
    PetController.instance.setViewingPet(true);
  }

  @override
  void deactivatePage() {
    PetController.instance.setViewingPet(false);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  PetWidget(),
                  PetStatusWidget()
                ]
              )
            ),
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: GoalProgressView(
              hideCompleted: true,
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }
}