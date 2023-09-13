import 'package:flutter/material.dart';
import 'package:todey3_flutter/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks =[
    Task(name: 'buy milk'),
    Task(name: 'buy eggs')
  ];

  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }
}