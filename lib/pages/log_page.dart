import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:healthapp/pages/log_add_food_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogScreen extends StatefulWidget {
  FoodItemController controller;
  LogScreen({required this.controller});

  @override
  _LogScreenState createState() => _LogScreenState();
}

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

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('loggedFood').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong (log_page: L41)');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot foodItem = snapshot.data!.docs[index];
                    return ListTile(
                      title: Text(foodItem['name','servingSize']),
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