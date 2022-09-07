import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/task/model/task.dart';

class DatatBaseHelper {
  Future<Database> dataBase() async {
    return openDatabase(join(await getDatabasesPath(), 'todo.db'),
        onCreate: ((db, version) {
      return db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, descripiton TEXT)',
      );
    }));
  }

  Future<void> insertTask(Task task) async {
    Database _db = await dataBase();
    await _db.insert(
      "tasks",
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
