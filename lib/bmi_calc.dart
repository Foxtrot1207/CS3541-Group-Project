import 'package:flutter/material.dart';

/// This class is used to calculate the BMI.
class CalcBMIModel {
  /// This function calculates the BMI using the weight and height.
  /// It throws an error if the weight or height is less than or equal to zero.
  double bmiCalc(double weight, double height) {
    /// Handles error cases like 0 or negative numbers.
    if(weight <= 0 || height <= 0){
      throw ArgumentError("Weight and height must be greater than zero.");
    }
    return ((weight * 703) / (height * height));
  }
}

 /// This class is the controller for the BMI calculator.
 /// It takes in the user's height and weight and calculates the BMI.
class CalcBMIController extends StatefulWidget {
   CalcBMIController({super.key});
  @override
  State<CalcBMIController> createState() => _CalcBMIControllerState();
}

class _CalcBMIControllerState extends State<CalcBMIController> {
  /// controllers take in the user inputted value
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  /// String to hold calculated BMI
  String resultBMI = "";

  /// This function calculates the BMI using the user's inputted height and weight.
  /// It then sets the state of the resultBMI string to the calculated BMI.
  void calculateBMI() {
    /// Taking input string into variable
    final double? height = double.parse(heightController.text);
    final double? weight = double.parse(weightController.text);
    final bmi = CalcBMIModel().bmiCalc(weight!, height!);
    setState(() {
      /// Pop up message with BMI to the the tenth decimal
      resultBMI = "Your BMI is ${bmi.toStringAsFixed(1)}";
    });
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
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: heightController, /// takes Height value
            decoration:  InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Height in Inches:',
            ),
            keyboardType: TextInputType.number, /// allows number only keyboard
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: weightController, /// takes Weight value
            decoration:  InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Weight in Pounds:',
            ),
            keyboardType: TextInputType.number, /// allows numbers only keyboard
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(resultBMI),
        ),
        TextButton(
          onPressed: calculateBMI,
          child: Text('Calculate BMI'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent.shade100), // Background color
            foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
            textStyle: MaterialStateProperty.all(
               TextStyle(
                fontSize: 20, // Text font size
                fontWeight: FontWeight.bold, // Text weight
              ),
            ),
          ),
        )
      ],
    );
  }
}
