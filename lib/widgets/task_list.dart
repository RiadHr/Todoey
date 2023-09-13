import 'package:flutter/material.dart';
import 'package:todey3_flutter/widgets/task_tile.dart';
import '../models/task.dart';


// class TaskList extends StatelessWidget {
//   final List<Task> tasks;
//   final Function checkboxCallback;
//
//   TaskList({required this.tasks,required this.checkboxCallback});
//
//   @override
//   Widget build(BuildContext context) {
//       return ListView.builder(itemBuilder: (context, index) {
//         return TaskTile(
//             taskTitle: tasks[index].name,
//             isChecked: tasks[index].isDone,
//             checkboxCallback: (value){
//               checkboxCallback(value,index);
//             }
//         );
//       },
//         itemCount: tasks.length,);
//
//   }
// }


class TaskList extends StatefulWidget {
  final List<Task> tasks;
  final Function checkboxCallback;

  TaskList({required this.tasks,required this.checkboxCallback});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  // List<Task> tasks =[
  //   Task(name: 'buy milk'),
  //   Task(name: 'buy eggs')
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback:
            (value) {
                setState(() {
                  widget.tasks[index].toggleDone();
                });
            }
      );
    },
    itemCount: widget.tasks.length,);
  }
}


// class TaskList extends StatelessWidget {
//   List<Task> tasks =[];
//   @override
//   Widget build(BuildContext context) {
//       return ListView(
//         children: [
//             TaskTile(taskText: 'task1'),
//             TaskTile(taskText: 'task2')
//         ],
//       );
//   }
// }
