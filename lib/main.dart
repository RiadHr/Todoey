import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey3_flutter/models/task_data.dart';
import 'package:todey3_flutter/screens/task_screen.dart';

import 'models/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Task> tasks =[
    Task(name: 'buy milk'),
    Task(name: 'buy eggs')
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        initialRoute: TaskScreen.id,
        routes: {
          TaskScreen.id:(context) => TaskScreen(tasks: tasks),
        },
      ),
    );
  }
}

