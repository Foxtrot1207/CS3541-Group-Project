import 'package:flutter/material.dart';
import '../model/bmi_model.dart';

class CalcBMIController extends StatefulWidget {
  final Function(double bmi, double weight) onBMIUpdated;

  CalcBMIController({Key? key, required this.onBMIUpdated}) : super(key: key);

  @override
  _CalcBMIControllerState createState() => _CalcBMIControllerState();
}

class _CalcBMIControllerState extends State<CalcBMIController> {
  //Controllers to take input weight and height
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  //Text prompt to input
  String resultBMI = "Please enter your details";

  final CalcBMIModel bmiCalculator = CalcBMIModel();  // BMI Calculator

  void calculateBMI() {
    try {
      //Processing user input
      double? height = double.tryParse(heightController.text);
      double? weight = double.tryParse(weightController.text);
      if (height == null || weight == null) {
        throw Exception("Height and weight must be numbers.");
      }
      double bmi = bmiCalculator.bmiCalc(weight, height); // Using the CalcBMIModel to calculate BMI
      setState(() {
        resultBMI = "Your BMI is ${bmi.toStringAsFixed(1)}";
      });
      widget.onBMIUpdated(bmi, weight); //callback with the new BMI and weight
    } catch (e) {
      setState(() {
        //Error case handling
        resultBMI = e is ArgumentError ? e.message : "Invalid input. Please enter valid numbers.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          //Input text field for height
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: TextFormField(
            controller: heightController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Height in Inches:',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          //Input text field for weight
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: weightController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Weight in Pounds:',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          //Output for BMU
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(resultBMI),
        ),
        ElevatedButton(
          //Calculate button
          onPressed: calculateBMI,
          child: Text('Calculate BMI'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent.shade100),
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
        ),
        //Reference scale
        const Text(
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
      ],
    );
  }
}
