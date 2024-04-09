import 'package:flutter/material.dart';
import 'package:healthapp/controller/person_info_controller.dart';

import 'log_create_item_page.dart';

class LogAddFoodScreen extends StatefulWidget {
  PersonInfoController controller;
  LogAddFoodScreen({required this.controller});

  @override
  _LogAddFoodScreenState createState() => _LogAddFoodScreenState();
}

class _LogAddFoodScreenState extends State<LogAddFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight, //Centered right like wireframe
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogCreateItemScreen(controller: widget.controller),
                  ),
                );
              },
              child: Text('Create Item'), // Button text
            ),
          ),

          const SizedBox(height: 100), //Space between placeholders

          Placeholder( //Saved Item Placeholder
            fallbackHeight:400, //size of box
            color: Colors.yellow!, //color of box
          ),
        ],
      ),
    );
  }
}