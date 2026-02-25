import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/data/datasources/task_local_datasource.dart';
import 'package:task_management_app/data/model/task_model.dart';
import 'package:task_management_app/data/repositories_Impl/task_repository_impl.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/providers/task_repository.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  final repository = TaskRepositoryImpl(TaskLocalDataSource());
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(repository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  HomePage(),
    );
  }
}

