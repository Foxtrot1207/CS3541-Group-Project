import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/view/food_item_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'log_create_item_page.dart';

class LogAddFoodScreen extends StatefulWidget {
  FoodItemController controller;
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

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('foodItems').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong (log_add: L45)');
                }

                if (snapshot.connectionState==ConnectionState.waiting) {
                  return Text("Loading");
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot foodItem = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(foodItem['name']),
                    );
                  },
                );
              },
            ),
            ),
        ],
      ),
    );
  }
}