import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/view/food_item_view.dart';

import 'log_create_item_page.dart';

class LogAddFoodScreen extends StatefulWidget {
  FoodItemController controller;
  LogAddFoodScreen({required this.controller});

  @override
  _LogAddFoodScreenState createState() => _LogAddFoodScreenState();
}

class _LogAddFoodScreenState extends State<LogAddFoodScreen> {
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
                    builder: (context) => LogCreateItemScreen(controller: widget.controller),
                  ),
                );
              },
              child: Text('Create Item'), // Button text
            ),
          ),

          const SizedBox(height: 100), //Space between placeholders

          Expanded(
            child: FoodItemView(
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }
}