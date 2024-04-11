import 'package:flutter/material.dart';

import 'package:healthapp/model/food_item.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/view/food_item_view.dart';

/// A stateful widget class that represents a screen for food items.
class FoodItemScreen extends StatefulWidget {
  FoodItemController controller;

  /// Constructor that requires a FoodItemController object.
  FoodItemScreen({required this.controller});

  @override
  _FoodItemScreenState createState() => _FoodItemScreenState();
}

/// The state class for the FoodItemScreen widget.
class _FoodItemScreenState extends State<FoodItemScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _calories = 0;
  String _servingSize = '';
  double _fat = 0;
  double _protein = 0;
  double _carbohydrates = 0;
  double _sugar = 0;
  double _caffeine = 0;
  double _water = 0;

  /// Builds the widget and returns a Scaffold object.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Items'),
      ),
      body: Column(
        children: [
          // UI for adding a new food item
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the food item name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Serving Size'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the serving size';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _servingSize = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Calories'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the calories (kcal)';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _calories = double.parse(value!);
                      },
                    ),
                    // TextFormFields for macros
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Protein'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the protein amount in grams';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _protein = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Carbs'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the carbs amount in grams';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _carbohydrates = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Fat'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the fat amount in grams';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _fat = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Sugar'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the sugar amount in grams';
                        }
                        return null;
                      },
                      onSaved: (value) {
                       _sugar = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Caffeine'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the caffeine amount in milligrams';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _caffeine = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Water'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the water amount in milliliters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _water = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Caffeine'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Caffeine amount';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _caffeine = double.parse(value!);
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Call the function to add the food item
                    // widget.controller.addFoodItem(FoodItem(name: _name, calories: _calories, fat_g: _fat, protein_g: _protein, carbohydrates_g: _carbohydrates, servingSize: _servingSize, sugar_g: _sugar, caffeine_mg: _caffeine, water_ml: _water));
                          // Clear the form fields
                          _formKey.currentState!.reset();
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}