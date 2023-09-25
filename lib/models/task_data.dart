import 'package:flutter/material.dart';
import 'package:todey3_flutter/models/task.dart';

class TaskData extends ChangeNotifier{
  List<Task> tasks =[
    Task(name: 'buy milk'),
    Task(name: 'buy eggs')
  ];

  int get taskCount{
    return tasks.length;
  }

  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }


}