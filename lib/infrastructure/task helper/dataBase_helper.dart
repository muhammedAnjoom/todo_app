import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/task/model/task.dart';

class DatatBaseHelper {
  Future<Database> dataBase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) async {
        return await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, descripiton TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<int> insertTask(Task task) async {
    int taskId = 0;
    Database _db = await dataBase();
    await _db
        .insert(
      "tasks",
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    )
        .then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<List<Task>> getTasks() async {
    Database _db = await dataBase();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');
    // await _db.delete('todo');
    return List.generate(taskMap.length, (index) {
      return Task(
        id: taskMap[index]['id'],
        title: taskMap[index]['title'],
        descripiton: taskMap[index]['descripiton'],
      );
    });

    // Remove the Dog from the database.
  }

  Future<void> deleteDog() async {}
}
