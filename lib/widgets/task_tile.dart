import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey3_flutter/models/task_data.dart';
import 'package:todey3_flutter/widgets/task_checkbox.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  // bool isChecked = false;
  final bool isChecked ;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressHandler;

  TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.longPressHandler});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        // int taskIndex = Provider.of<TaskData>(context,listen: false).indexTask(taskTitle);
        // print(taskIndex);
        // Task currentTask = Provider.of<TaskData>(context,listen: false).tasks[taskIndex];
        // print(currentTask);
        // Provider.of<TaskData>(context,listen: false ).removeTask(currentTask);
        longPressHandler();
      },
      leading: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked == true ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor:Colors.lightBlueAccent ,
        onChanged: (value) {
          checkboxCallback(value);
          print('ischecked = $isChecked');
        },
        value: isChecked,
      )
    );
  }
}






// class TaskTile extends StatefulWidget {
//   final String taskText;
//   TaskTile({required this.taskText});
//
//   @override
//   State<TaskTile> createState() => _TaskTileState();
// }
//
// class _TaskTileState extends State<TaskTile> {
//   //dont declare functions or variable after build function
//   bool isChecked = false;
//
//   void checkboxCallback(bool newValue){
//       setState(() {
//         isChecked = newValue;
//         print('ischecked = $isChecked ');
//       });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Text(
//         widget.taskText,
//         style: TextStyle(
//             decoration: isChecked == true ? TextDecoration.lineThrough : null),
//       ),
//       trailing: TaskCheckbox(
//         checkboxState: isChecked,
//         checkboxCallback: checkboxCallback
//       ),
//     );
//   }
// }
