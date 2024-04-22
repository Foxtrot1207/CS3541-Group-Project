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
class _LogScreenState extends State<LogScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Log"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                selectedDate = selectedDate.subtract(Duration(days: 1));
              });
              widget.controller.setLogDate(selectedDate);
            },
          ),
          Text(
            "${selectedDate.toLocal()}".split(' ')[0], // This will display the date in yyyy-mm-dd format
            style: TextStyle(fontSize: 18.0),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              setState(() {
                selectedDate = selectedDate.add(Duration(days: 1));
              });
              widget.controller.setLogDate(selectedDate);
            },
          ),
        ],
      ),
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
            child: StreamBuilder<QuerySnapshot>(
              stream: widget.controller.getLog(formattedDate),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                List<DocumentSnapshot> currentDayFoodItems = snapshot.data!.docs;

                if (currentDayFoodItems.isEmpty) {
                  return const Text("No food items for today");
                }

                return ListView(
                  children: currentDayFoodItems.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return Dismissible(
                      key: Key(document.id),
                      onDismissed: (direction) {
                        FoodItem foodItem = FoodItem.fromMap(data);
                        widget.controller.removeFoodItem(foodItem, document.id, selectedDate);
                      },
                      background: Container(color: Colors.red,),
                      child: ListTile(
                        title: Text(data['name']),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Servings: ${data['servings']}'),
                            Text('Calories: ${data['calories']}'),
                          ],
                        )
                      )
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