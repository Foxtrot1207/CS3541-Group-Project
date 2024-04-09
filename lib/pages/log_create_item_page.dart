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
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String servingSize = '';
  double calories = 0;
  double protein = 0;
  double fat = 0;
  double carbohydrates = 0;
  double sugar = 0;
  double caffeine = 0;
  double water = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget> [
            //TODO: Add TextFormField widgets for each nutrient

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  widget.controller.addFoodItem(FoodItem(
                    name: name,
                    servingSize: servingSize,
                    calories: calories,
                    protein: protein,
                    fat: fat,
                    carbohydrates: carbohydrates,
                    sugar: sugar,
                    caffeine: caffeine,
                    water: water,
                  ));
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}