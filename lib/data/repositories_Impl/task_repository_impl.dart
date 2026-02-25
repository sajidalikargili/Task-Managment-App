import 'package:task_management_app/data/model/task_model.dart';
import 'package:task_management_app/domain/respositories/task_repository.dart';
import '../../domain/entities/task.dart';
import '../datasources/task_local_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTask(Task task) async {
    await localDataSource.addTask(TaskModel.fromEntity(task));
  }

  @override
  Future<List<Task>> getTasks() async {
    final models = await localDataSource.getTasks();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    await localDataSource.addTask(TaskModel.fromEntity(task));
  }

  @override
  Future<void> deleteTask(String id) async {
    await localDataSource.deleteTask(id);
  }
}