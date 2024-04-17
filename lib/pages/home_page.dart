import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/view/pet_widget.dart';

class HomeScreen extends StatefulWidget {
  PersonInfoController controller;
  HomeScreen({required this.controller});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          
          PetWidget(),
          
        ],
      ),
    );
  }
}