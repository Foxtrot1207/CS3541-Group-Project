import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:healthapp/controller/food_item_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Food Catalog'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogCreateItemScreen(controller: widget.controller),
                ),
              );
            },
            child: Text('Create Item'),

          ),
        ],
      ),
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
          const SizedBox(height: 15), // Space between search bar and list
          Expanded(
            // child: Container
            child: StreamBuilder<QuerySnapshot>(
              stream: (search != "" && search != null) ? FirebaseFirestore.instance
                  .collection('Food Catalog')
                  .where('name', isGreaterThanOrEqualTo: search)
                  .where('name', isLessThan: search + 'z')
                  .snapshots()
                  : FirebaseFirestore.instance
                  .collection('Food Catalog')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                final servingsController = TextEditingController();

                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(document.id),
                      subtitle: Text('Serving: ${data['serving_size']}, Calories: ${data['calories']}'),
                      trailing: ElevatedButton(
                        child: Text('Add to Log'),
                        onPressed: () async {
                          await showDialog<int>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('${data['name']} (${data['serving_size']})'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(height: 20),
                                    Text("Number of Servings:"),
                                    TextField(
                                      controller: servingsController,
                                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                                      ],
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop(int.parse(servingsController.text));
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          int servings = int.parse(servingsController.text);
                          if (servings != null) {
                            data['name'] = document.id;
                            widget.controller.logFoodItem(data, servings, DateTime.now());
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Added to Log!'))
                            );
                          }
                          servingsController.clear();
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