import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/view/food_screen.dart';

class LogCreateItemScreen extends StatefulWidget {
  FoodItemController controller;
  LogCreateItemScreen({required this.controller});

  @override
  _LogCreateItemScreenState createState() => _LogCreateItemScreenState();
}

class _LogCreateItemScreenState extends State<LogCreateItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FoodItemScreen(controller: widget.controller),
    );
  }
}