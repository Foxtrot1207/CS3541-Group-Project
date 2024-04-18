import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthapp/model/food_item.dart';
import 'package:intl/intl.dart';

import 'log_create_item_page.dart';
import 'package:healthapp/controller/food_item_controller.dart';

class LogAddFoodScreen extends StatefulWidget {
  FoodItemController controller;
  LogAddFoodScreen({required this.controller});

  @override
  _LogAddFoodScreenState createState() => _LogAddFoodScreenState();
}

class _LogAddFoodScreenState extends State<LogAddFoodScreen> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  search = value;
                });
              },
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
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
          const SizedBox(height: 20), //Space between placeholders
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Food Catalog')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(document.id),
                      subtitle: Text('Serving: ${data['serving_size']}, Calories: ${data['calories']}'),
                      trailing: ElevatedButton(
                        child: Text('Add to Log'),
                        onPressed: (){
                          data['name'] = document.id;
                          String formattedDate = DateFormat('yyyyMMdd').format(DateTime.now());
                          widget.controller.logFoodItem(data, formattedDate); // Pass the date to addFoodToLog
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to Log!'))
                          );
                        },
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