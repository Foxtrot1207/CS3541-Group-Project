import 'package:flutter/material.dart';

class CalcBMIModel {
  double bmiCalc(double weight, double height) {
    //Handles error cases like 0 or negative numbers.
    if(weight <= 0 || height <= 0){
      throw ArgumentError("Weight and height must be greater than zero.");
    }
    return ((weight * 703) / (height * height));
  }
}

class CalcBMIController extends StatefulWidget {
  const CalcBMIController({super.key});
  @override
  State<CalcBMIController> createState() => _CalcBMIControllerState();
}

class _CalcBMIControllerState extends State<CalcBMIController> {
  //controllers take in the user inputted value
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  //String to hold calculated BMI
  String resultBMI = "";

  void calculateBMI() {
    //Taking input string into variable
    final double? height = double.parse(heightController.text);
    final double? weight = double.parse(weightController.text);
    final bmi = CalcBMIModel().bmiCalc(weight!, height!);
    setState(() {
      //Pop up message with BMI to the the tenth decimal
      resultBMI = "Your BMI is ${bmi.toStringAsFixed(1)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: heightController, //takes Height value
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Height in Inches:',
            ),
            keyboardType: TextInputType.number, //allows number only keyboard
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: weightController, //takes Weight value
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Weight in Pounds:',
            ),
            keyboardType: TextInputType.number, //allows numbers only keyboard
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(resultBMI),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: calculateBMI,
          child: const Text('Calculate BMI'),
        )
      ],
    );
  }
}
