import 'package:flutter/material.dart';
import 'package:task_management_app/domain/respositories/task_repository.dart';
import '../../domain/entities/task.dart';
class TaskProvider extends ChangeNotifier {
  final TaskRepository repository;

  TaskProvider(this.repository);

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    _tasks = await repository.getTasks();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await repository.addTask(task);
    await loadTasks();
  }

  Future<void> toggleTask(Task task) async {
    final updated = task.copyWith(isCompleted: !task.isCompleted);
    await repository.updateTask(updated);
    await loadTasks();
  }

  Future<void> deleteTask(String id) async {
    await repository.deleteTask(id);
    await loadTasks();
  }
}