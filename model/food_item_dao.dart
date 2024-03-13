import 'package:cloud_firestore/cloud_firestore.dart';
import 'food_item.dart';

class FoodItemDAO {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addFoodItem(FoodItem foodItem) async {
    await _db.collection('foodItems').add(foodItem.toMap());
  }

  Future<List<FoodItem>> getFoodItems() async {
    QuerySnapshot querySnapshot = await _db.collection('foodItems').get();
    return querySnapshot.docs.map((doc) => FoodItem.fromMap(doc.data())).toList();
  }

// Implement updateFoodItem and deleteFoodItem similarly
}
