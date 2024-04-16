import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/model/food_item.dart';
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  FoodItem newFoodItem = FoodItem(
                    name: name,
                    servingSize: servingSize,
                    calories: calories,
                    protein_g: protein,
                    fat_g: fat,
                    carbohydrates_g: carbohydrates,
                    sugar_g: sugar,
                    caffeine_mg: caffeine,
                    water_ml: water,
                  );
                  widget.controller.addFoodItem(newFoodItem);

                  // Add food item to Firestore
                  CollectionReference foods =
                  FirebaseFirestore.instance.collection('/default');
                  await foods.add({
                    'name': newFoodItem.name,
                    'servingSize': newFoodItem.servingSize,
                    'calories': newFoodItem.calories,
                    'protein_g': newFoodItem.protein_g,
                    'fat_g': newFoodItem.fat_g,
                    'carbohydrates_g': newFoodItem.carbohydrates_g,
                    'sugar_g': newFoodItem.sugar_g,
                    'caffeine_mg': newFoodItem.caffeine_mg,
                    'water_ml': newFoodItem.water_ml,
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Saved to Food List!'))
                  );

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