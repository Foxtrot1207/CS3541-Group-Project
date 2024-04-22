import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/bmi_model.dart';

class CalcBMIController extends StatefulWidget {
  CalcBMIController({super.key});
  @override
  State<CalcBMIController> createState() => _CalcBMIControllerState();
}

class _CalcBMIControllerState extends State<CalcBMIController> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String resultBMI = "Please enter your details";

  void calculateBMI() {
    try {
      final double? height = double.tryParse(heightController.text);
      final double? weight = double.tryParse(weightController.text);
      if (height == null || weight == null || height <= 0 || weight <= 0) {
        throw Exception("Invalid height or weight");
      }
      final bmi = CalcBMIModel().bmiCalc(weight, height);
      setState(() {
        resultBMI = "Your BMI is ${bmi.toStringAsFixed(1)}";
      });
    } catch (e) {
      setState(() {
        resultBMI = "Invalid input. Please enter valid numbers.";
      });
    }
  }

  /// This function builds the widget for the BMI calculator.
  /// It includes text fields for the user to input their height and weight,
  /// a text button to calculate the BMI, and a text field to display the calculated BMI.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: TextFormField(
            controller: heightController,

            /// takes Height value
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Height in Inches:',
            ),
            keyboardType: TextInputType.number,

            /// allows number only keyboard
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: weightController,

            /// takes Weight value
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Weight in Pounds:',
            ),
            keyboardType: TextInputType.number,

            /// allows numbers only keyboard
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(resultBMI),
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent.shade100), // Background color
            foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
          ),
          onPressed: calculateBMI,
          child: const Text('Calculate BMI'),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "0 - 18.5 = Underweight\n"
                "18.5 - 24.9 = Healthy\n"
                "25 - 29.9 = Overweight\n"
                "30+ = Obese",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
