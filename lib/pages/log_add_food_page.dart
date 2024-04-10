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
              stream: FirebaseFirestore.instance.collection('/default')
                  .orderBy('name') // Order by field name
                  .where('name', isGreaterThanOrEqualTo: search) // Search functionality
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
                      title: Text(data['name']),
                      subtitle: Text('Calories: ${data['calories']}, Serving: ${data['servingSize']}'),
                      onTap: () {
                        // Interactive action when tapping the item
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => YourDetailScreen(data: data),
                        //   ),
                        // );
                      },
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