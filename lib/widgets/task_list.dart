import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey3_flutter/models/task_data.dart';
import 'package:todey3_flutter/widgets/task_tile.dart';
import '../models/task.dart';



class TaskList extends StatelessWidget {
  final Function checkboxCallback;

  TaskList({required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData, child) {
        return ListView.builder(itemBuilder: (context, index) {
          Task currentTask = taskData.tasks[index];
          return TaskTile(
              taskTitle: currentTask.name,
              isChecked: currentTask.isDone,
              checkboxCallback: (value) => checkboxCallback(currentTask.isDone,index),
                  // (value) {
                  //     setState(() {
                  //       taskData.tasks[index].toggleDone();
                  //     });
              // }
              longPressHandler: (){
                taskData.removeTask(currentTask);
              },
          );
        },
          itemCount: taskData.taskCount,);
      },
    );
  }
}

// code version 3
// class TaskList extends StatefulWidget {
//   // final List<Task> tasks;
//   final Function checkboxCallback;
//
//   TaskList({required this.checkboxCallback});
//
//   @override
//   State<TaskList> createState() => _TaskListState();
// }
//
// class _TaskListState extends State<TaskList> {
//   // List<Task> tasks =[
//   //   Task(name: 'buy milk'),
//   //   Task(name: 'buy eggs')
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     //instead of using that var we use Consumer widget from provider package
//     // List<Task> tasksProvided = Provider.of<TaskData>(context).tasks;
//     return Consumer<TaskData>(
//       builder: (context,taskData, child) {
//         return ListView.builder(itemBuilder: (context, index) {
//           return TaskTile(
//               taskTitle: taskData.tasks[index].name,
//               isChecked: taskData.tasks[index].isDone,
//               checkboxCallback:
//                   (value) {
//                 setState(() {
//                   taskData.tasks[index].toggleDone();
//                 });
//               }
//           );
//         },
//           itemCount: taskData.taskCount,);
//       },
//     );
//   }
// }




// code version 2
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




//code version1
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
