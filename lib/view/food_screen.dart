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
  double _servingSize = 0;
  double _ozWater = 0;
  Map<String, double> _macros = {'protein': 0, 'carbs': 0, 'fat': 0, 'sugar': 0};

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
                        _servingSize = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Calories'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the calories';
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
                          return 'Please enter the protein amount';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _macros['protein'] = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Carbs'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the carbs amount';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _macros['carbs'] = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Water'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          value = '0.0';
                          return null;
                        }
                        return null;
                      },
                      onSaved: (value) {
                         _ozWater = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Sugar'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the sugar amount';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _macros['sugar'] = double.parse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Fat'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the fat amount';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _macros['fat'] = double.parse(value!);
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Call the function to add the food item

                          widget.controller.addFoodItem(FoodItem(name: _name, calories: _calories, macros: _macros, servingSize: _servingSize, ozWater: _ozWater,));
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
