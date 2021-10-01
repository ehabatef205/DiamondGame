import 'package:flutter/material.dart';
import 'package:diamondgame/models/name.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


class SQL_Helper {

  static SQL_Helper dbHelper;
  static Database _database;

  SQL_Helper._createInstance();

  factory SQL_Helper() {
    if (dbHelper == null) {
      dbHelper = SQL_Helper._createInstance();
    }
    return dbHelper;
  }

  String tableName = "names_table";
  String _id = "id";
  String _name = "name";
  String _level = 'level';
  String _question = 'question';
  String _totalScore = 'totalScore';
  String _scoreLevel = 'scoreLevel';
  String _timer = 'timer';

  Future<Database> get database async {
    if (_database == null){
      _database = await initializedDatabase();
    }
    return _database;
  }


  Future<Database> initializedDatabase() async {

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "names.db";

    var nameDB = await openDatabase(path, version: 1, onCreate: createDatabase);
    return nameDB;
  }


  void createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY AUTOINCREMENT, $_name TEXT, $_level INTEGER, $_question INTEGER, $_totalScore INTEGER, $_scoreLevel INTEGER, $_timer INTEGER)");
  }

  Future<List<Map<String, dynamic>>> getNameMapList() async {
    Database db = await this.database;

    //var result1 =  await db.rawQuery("SELECT * FROM $tableName ORDER BY $_id ASC");
    var result = await db.query(tableName, orderBy: "$_id ASC");
    return result;
  }

  Future<int> insertName(Name name) async {
    Database db = await this.database;
    var result = await db.insert(tableName, name.toMap());
    return result;
  }

  Future<int> updateName(Name name) async{
    Database db = await this.database;
    var result = await db.update(tableName, name.toMap(), where: "$_id = ?", whereArgs: [name.id]);
    return result;
  }


  Future<int> deleteName(int id) async {
    var db = await this.database;
    int result = await db.rawDelete("DELETE FROM $tableName WHERE $_id = $id");
    return result;
  }


  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> all = await db.rawQuery("SELECT COUNT (*) FROM $tableName");
    int result = Sqflite.firstIntValue(all);
    return result;
  }

  Future<List<Name>> getNameList() async{

    var nameMapList = await getNameMapList();
    int count = nameMapList.length;

    List<Name> names = new List<Name>();

    for (int i = 0; i <= count -1; i++){
      names.add(Name.getMap(nameMapList[i]));
    }

    return names;
  }
}