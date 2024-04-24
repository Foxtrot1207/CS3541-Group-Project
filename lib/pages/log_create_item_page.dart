import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/model/food_item.dart';

class LogCreateItemScreen extends StatefulWidget {
  FoodItemController controller;
  LogCreateItemScreen({required this.controller});

  @override
  _LogCreateItemScreenState createState() => _LogCreateItemScreenState();
}

class _LogCreateItemScreenState extends State<LogCreateItemScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String serving_size = '';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          ('Create Food'),
          style: TextStyle(color: Color(0xFF803824)),
        ),
        actions: [
          TextButton(
            onPressed: _saveForm,
            child: Text(
              'Save',
              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTextField(
                'Name',
                '',
                    (value) {
                  name = value!;
                },
              ),
              SizedBox(height: 8.0),
              _buildTextField(
                'Serving Size',
                'What would a single serving of this item be?',
                    (value) {
                  serving_size = value!;
                },
              ),
              SizedBox(height: 8.0),
              _buildTextField(
                'Calories',
                'in a single serving',
                    (value) {
                  calories = double.parse(value!);
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8.0),
              _buildTextField(
                'Protein',
                'in a single serving',
                    (value) {
                  protein = double.parse(value!);
                },
                keyboardType: TextInputType.number,
                unit: 'gram(s)',
              ),
              SizedBox(height: 8.0),
              _buildTextField(
                'Total Fat',
                'in a single serving',
                    (value) {
                  fat = double.parse(value!);
                },
                keyboardType: TextInputType.number,
                unit: 'gram(s)',
              ),
              SizedBox(height: 8.0),
              _buildTextField(
                'Carbohydrates',
                'in a single serving',
                    (value) {
                  carbohydrates = double.parse(value!);
                },
                keyboardType: TextInputType.number,
                unit: 'gram(s)',
              ),
              SizedBox(height: 8.0),
              _buildTextField(
                'Sugar',
                'in a single serving',
                    (value) {
                  sugar = double.parse(value!);
                },
                keyboardType: TextInputType.number,
                unit: 'gram(s)',
              ),
              SizedBox(height: 8.0),
              _buildTextField(
                'Caffeine',
                'in a single serving',
                    (value) {
                  caffeine = double.parse(value!);
                },
                keyboardType: TextInputType.number,
                unit: "milligram(s)",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String helperText, Function(String?) onSaved, {TextInputType keyboardType = TextInputType.text, String unit = ''}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1.0),
          Container(
            width: double.infinity, // Make the text field fill the available width
            height: 60.0, // Set the height of the text field
            child: TextFormField(
              decoration: InputDecoration(
                hintText: helperText,
                border: OutlineInputBorder(),
                suffixText: unit,
              ),
              onSaved: onSaved,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please make sure all fields are filled';
                }
                return null;
              },
              keyboardType: keyboardType,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.controller.createFoodItem(FoodItem(
        name: name,
        serving_size: serving_size,
        calories: calories,
        protein_g: protein,
        fat_g: fat,
        carbohydrates_g: carbohydrates,
        sugar_g: sugar,
        caffeine_mg: caffeine,
        water_ml: water,
      ));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Food item saved successfully')),
      );
      Navigator.pop(context);
    }
  }
}