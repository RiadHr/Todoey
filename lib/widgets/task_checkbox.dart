import 'package:flutter/material.dart';

class TaskCheckbox extends StatelessWidget {
  final Function checkboxCallback;
  final bool checkboxState;

  TaskCheckbox({required this.checkboxState,required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor:Colors.lightBlueAccent ,
      onChanged: (value) {
        checkboxCallback(value);
      },
      value: checkboxState,
    );
  }
}

// code version 1
// class TaskCheckbox extends StatefulWidget {
//   @override
//   State<TaskCheckbox> createState() => _TaskCheckboxState();
// }
//
// class _TaskCheckboxState extends State<TaskCheckbox> {
//   bool? checkboxState = false;
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor:Colors.lightBlueAccent ,
//       onChanged: (value) {
//         setState(() {
//           checkboxState = value;
//         });
//         // checkboxCallback(value);
//         },
//       value: checkboxState,
//     );
//   }
// }
//
//
