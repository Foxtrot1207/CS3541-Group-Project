import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/pages/log_add_food_page.dart';

class LogScreen extends StatefulWidget {
  FoodItemController controller;
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
        Align(
        alignment: Alignment.centerRight, //Centered right like wireframe
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LogAddFoodScreen(controller: widget.controller),
              ),
            );
          },
          child: Text('Add Food'), // Button text
        ),
      ),

          Placeholder( //Food Log Placeholder
            fallbackHeight:500, //size of box
            color: Colors.black!, //color of box
          ),
        ],
      ),
    );
  }
}