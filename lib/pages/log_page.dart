import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
//LogAddFoodScreen
//Add Food
class _LogScreenState extends State<LogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogAddFoodScreen(controller: widget.controller),
                  ),
                );
              },
              child: Text('Add Food'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent.shade100,), //Background color
                foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 18, // Text font size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
              ),
            ),
          ),
//TODO: Get removal and duplicates working
          Expanded(
            child: StreamBuilder<List<QuerySnapshot>>(
              stream: widget.controller.getLog(),
              builder: (BuildContext context, AsyncSnapshot<List<QuerySnapshot>> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return ListView(
                  children: snapshot.data!.expand((querySnapshot) => querySnapshot.docs).map((DocumentSnapshot document) {
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