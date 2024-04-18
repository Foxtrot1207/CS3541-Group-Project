import 'package:flutter/material.dart';
import 'package:healthapp/controller/food_item_controller.dart';
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
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogCreateItemScreen(controller: widget.controller),
                  ),
                );
              },
              child: Text('Create Item'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent.shade100,), //Background color
                foregroundColor: MaterialStateProperty.all(Colors.black), // Text color
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 20, // Text font size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20), //Space between placeholders
          //LogCreateItemScreen
          //Create Item
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
                          widget.controller.addFoodToLog(data);
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