import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/structure/task.dart';

final String taskTable = "taskTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String completedColumn = "completedColumn";
final String priorityColumn = "priorityColumn";
final String descriptionColumn = "descriptionColumn";

class Helper {
  static final Helper _instance = Helper.internal();

  factory Helper() => _instance;

  Helper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contactsnew.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $taskTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $descriptionColumn TEXT,"
          "$priorityColumn TEXT, $completedColumn TEXT);");
    });
  }

  Future<Task> saveTask(Task contact) async {
    Database dbContact = await db;
    contact.id = await dbContact.insert(taskTable, contact.toMap());
    return contact;
  }

  Future<Task> getTask(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(taskTable,
        columns: [
          idColumn,
          nameColumn,
          completedColumn,
          descriptionColumn,
          priorityColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Task.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteTask(int id) async {
    Database dbContact = await db;
    return await dbContact
        .delete(taskTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateTask(Task contact) async {
    Database dbContact = await db;
    return await dbContact.update(taskTable, contact.toMap(),
        where: "$idColumn = ?", whereArgs: [contact.id]);
  }

  Future<List> getAllTask() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM $taskTable");
    List<Task> listContact = List();
    for (Map m in listMap) {
      listContact.add(Task.fromMap(m));
    }
    return listContact;
  }

  Future<int> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT(*) FROM $taskTable"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }
}
