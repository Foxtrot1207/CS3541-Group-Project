import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';
import 'package:healthapp/pages/profile_bmi_page.dart';

class ProfileScreen extends StatefulWidget {
  final PersonInfoController controller;

  ProfileScreen({required this.controller});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight, // Centered right like wireframe
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileBMIScreen(controller: widget.controller),
                  ),
                );
              },
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
              child: const Text('Calculate BMI'), // Button text
            ),
          ),

          const SizedBox(height: 100), // Space between placeholders

          const Placeholder( // BMI and Weight
            fallbackHeight: 200, // Size of box
            color: Colors.red, // Color of box
          ),

          const SizedBox(height: 100), // Space between placeholders

          const Placeholder( // Resource List
            fallbackHeight: 150, // Size of box
            color: Colors.green, // Color of box
          ),
        ],
      ),
    );
  }
}
