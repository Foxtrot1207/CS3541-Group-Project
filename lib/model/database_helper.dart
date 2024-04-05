import 'dart:async';
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:flutter/material.dart';

import 'food_item.dart';

/// A helper class to manage database operations.
class DatabaseHelper {
  static final _databaseName = "nutrition.db";
  static final _databaseVersion = 1;

  static final table = 'nutrition';

  static final columnName = 'name';
  static final columnServingSize = 'serving_size';
  static final columnCalories = 'calories';
  static final columnFat = 'fat_g';
  static final columnProtein = 'protein_g';
  static final columnCarbs = 'carbohydrates_g';
  static final columnSugar = 'sugar_g';
  static final columnCaffeine = 'caffeine_mg';
  static final columnWater = 'water_ml';

  /* make this a single class */
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  /* single app-wide reference to database only */
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /* open database */
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
    version: _databaseVersion,
    onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      $columnName TEXT PRIMARY KEY,
      $columnServingSize REAL,
      $columnCalories REAL,
      $columnFat REAL,
      $columnProtein REAL,
      $columnCarbs REAL,
      $columnSugar REAL,
      $columnCaffeine REAL,
      $columnWater REAL
    )
  ''');
  }


  /* helper methods */
Future<int> insert(FoodItem item) async {
  Database db = await instance.database;
  return await db.insert(table, item.toMap());
}

Future<List<Map<String, dynamic>>> queryAllRows() async {
  Database db = await instance.database;
  return await db.query(table);
}

  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(FoodItem item) async {
    Database db = await instance.database;
    int id = item.toMap()[columnName];
    return await db.update(table, item.toMap(), where: '$columnName = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnName = ?', whereArgs: [id]);
  }

}