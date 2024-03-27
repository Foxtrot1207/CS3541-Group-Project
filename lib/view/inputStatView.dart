
import 'package:flutter/material.dart';

class InputStatView extends StatefulWidget {
  final String title;
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController nutritionController = TextEditingController();
  final Function(String, String, String) addStatCallback;

  InputStatView({
    Key? key,
    required this.title,
    required this.addStatCallback,
  }) : super(key: key);

  @override
  _InputStatViewState createState() => _InputStatViewState();
}

class _InputStatViewState extends State<InputStatView> {
  String selectedDay = 'Monday';
  String caloriesToday = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select the day:',
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: selectedDay,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedDay = newValue;
                  });
                }
              },
              items: <String>[
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thursday',
                'Friday',
                'Saturday',
                'Sunday',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Enter the how much calories you took today:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: widget.caloriesController,
              keyboardType: TextInputType.number,
              onChanged: (value){
                setState(() {
                  caloriesToday = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Enter the how much nutrition you took today:',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: widget.nutritionController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.addStatCallback(
                  selectedDay,
                  widget.caloriesController.text,
                  widget.nutritionController.text,
                );
                widget.caloriesController.clear();
                widget.nutritionController.clear();
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 32),
            Text(
              'Calories today: $caloriesToday',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
