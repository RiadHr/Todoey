import 'package:flutter/material.dart';
import 'package:todey3_flutter/models/task.dart';

class TaskData extends ChangeNotifier{
  late List<Task> tasks;

  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }
}