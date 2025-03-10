import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/pages/base_page.dart';
import 'package:healthapp/pages/profile_bmi_page.dart';
import 'package:healthapp/view/pet_widget.dart';

class ProfileScreen extends BaseStatefulPage {
  final PersonInfoController controller;

  ProfileScreen({required this.controller});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    //Controllers to hold last calc BMI and input weight
    final lastBMI = widget.controller.LastBMI();
    final lastWeight = widget.controller.LastWeight();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Profile Statisitcs',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          Align(
            alignment: Alignment.centerRight, // Centered right like wireframe
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //Route to the subpage
                    builder: (context) => ProfileBMIScreen(controller: widget.controller),
                  ),
                ).then((value) => setState(() {}));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent.shade100), // Background color
                foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 20, // Text font size
                    fontWeight: FontWeight.bold, // Text style
                  ),
                ),
              ),
              child: const Text('Calculate BMI'), // Button text
            ),
          ),
           Expanded(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Text fields to display last weight and BMI
                  Text('Last BMI: $lastBMI', style: TextStyle(fontSize: 24, color: Colors.black)),
                  Text('Last Weight: $lastWeight lbs', style: TextStyle(fontSize: 24, color: Colors.black)),
                  PetWidget()
              ],
      ),
           )
    ])
    );
  }
}
