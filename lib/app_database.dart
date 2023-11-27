import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// 24 nov
class AppDatabase {
  // private constructor (singleton )

  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();
//database variable
  Database? myDB;
  static final NOTE_TABLE = "Note";

  Future<Database> initDB() async {
    var docDirectory = await getApplicationDocumentsDirectory();
    var dbPath = join(
      docDirectory.path,
      "notesDB.db",
    );
    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      //create all your tables here
      db.execute(
          "create table notes ( noteId integer primary key autoincrement, title text, desc text )");
    });
  }

  void getDb() {}

  Future<Database> getDB() async {
    if (myDB != null) {
      return myDB!;
    } else {
      myDB = await initDB();
      return myDB!;
    }
  }

  void addNote(String mTitle, String mDesc) async {
    var db = await getDB();
    db.insert("notes", {"title": mTitle, "desc": mDesc});
  }

  Future<List<Map<String, dynamic>>> fetchNote() async {
    var db = await getDB();
    var data = await db.query(
      "notes",
    );
    return data;
  }

//sample comment for last line to keep  the space on save button
}
