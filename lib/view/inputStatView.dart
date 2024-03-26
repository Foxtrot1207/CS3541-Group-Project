import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController nutritionController = TextEditingController();
  final Function(String, String) addStatCallback;

  MyHomePage({super.key,
    required this.title,
    required this.addStatCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the how much calories you took today:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: caloriesController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Text(
              'Enter the how much nutrition you took today:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: nutritionController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                addStatCallback(caloriesController.text, nutritionController.text);
                caloriesController.clear();
                nutritionController.clear();
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 32),
            Text(
              'Calories today:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Displaying stats will go here
          ],
        ),
      ),
    );
  }
}