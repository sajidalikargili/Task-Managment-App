import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_management_app/data/model/task_model.dart';

class TaskLocalDataSource {
  static const boxName = "tasksBox";

  Future<Box<TaskModel>> _box() async {
    return await Hive.openBox<TaskModel>(boxName);
  }

  Future<void> addTask(TaskModel task) async {
    final box = await _box();
    await box.put(task.id, task);
  }

  Future<List<TaskModel>> getTasks() async {
    final box = await _box();
    return box.values.toList();
  }

  Future<void> deleteTask(String id) async {
    final box = await _box();
    await box.delete(id);
  }
}