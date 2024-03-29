import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'food_item.dart';

class DatabaseHelper {
  static final _databaseName = "NutritionDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'food_item_table';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnServingSize = 'servingSize';
  static final columnCalories = 'calories';
  static final columnCarbs = 'carbs';
  static final columnFat = 'fat';
  static final columnProtein = 'protein';
  static final columnSugar = 'sugar';

  // Make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Open the database and create it if it doesn't exist
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnServingSize REAL NOT NULL,
            $columnCalories REAL NOT NULL,
            $columnCarbs REAL NOT NULL,
            $columnFat REAL NOT NULL,
            $columnProtein REAL NOT NULL,
            $columnSugar REAL NOT NULL
          )
          ''');
  }

// All of the other database helper methods
}
