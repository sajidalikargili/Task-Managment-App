import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/presentation/providers/task_repository.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/task.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final uuid = const Uuid();

  @override
  void initState() {
    super.initState();
    Future.microtask(
          () => context.read<TaskProvider>().loadTasks(),
    );
  }

  void addTask() {
    final task = Task(
      id: uuid.v4(),
      title: titleController.text,
      description: descController.text,
    );

    context.read<TaskProvider>().addTask(task);
    titleController.clear();
    descController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TaskProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Task Manager")),
      body: Column(
        children: [
          TextField(controller: titleController),
          TextField(controller: descController),
          ElevatedButton(onPressed: addTask, child: const Text("Add")),

          Expanded(
            child: ListView.builder(
              itemCount: provider.tasks.length,
              itemBuilder: (context, index) {
                final task = provider.tasks[index];

                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) =>
                        provider.toggleTask(task),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        provider.deleteTask(task.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}