import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthapp/main.dart';
import 'package:rxdart/rxdart.dart';

import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/pages/log_add_food_page.dart';
import 'package:healthapp/model/food_item.dart';


class LogScreen extends StatefulWidget {
  FoodItemController controller;

  LogScreen({required this.controller});

  @override
  _LogScreenState createState() => _LogScreenState();
}

//TODO: • ONLY SHOW CURRENT DAY LOG LIST
//TODO: • CLEAR LOG LIST IF THERE IS NO CURRENT DAY LIST/CREATE NEW DATABASE WHEN DAY CHANGES
//TODO: • REMOVE BUTTONS WORK ON DISPLAYED DAY
//TODO: !MAYBE! • ADD BUTTON TOOL TO SWITCH BETWEEN DAYS, ONLY CAN ADD TO CURRENT DAY

class _LogScreenState extends State<LogScreen> {
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
                    builder: (context) => LogAddFoodScreen(controller: widget.controller),
                  ),
                );
              },
              child: Text('Add Food'), // Button text
            ),
          ),
//TODO: Get removal and duplicates working
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: widget.controller.getLog(formattedDate),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                List<DocumentSnapshot> currentDayFoodItems = snapshot.data!.docs;

                if (currentDayFoodItems.isEmpty) {
                  return Text("No food items for today");
                }

                return ListView(
                  children: currentDayFoodItems.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(document.id),
                      subtitle: Text('Serving: ${data['serving_size']}, Calories: ${data['calories']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          FoodItem foodItem = FoodItem.fromMap(data);
                          widget.controller.removeFoodItem(foodItem);
                        },
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}