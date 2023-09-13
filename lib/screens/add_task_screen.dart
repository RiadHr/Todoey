import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  // final List<Task> tasks;
  final Function addTaskHandler;
  //the function handler(callback) must be at same level of the state variable exp tasks must
  // be in taskscreen this why it make that problem of delay

  AddTaskScreen({ required this.addTaskHandler});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String taskName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'add task',
                border: OutlineInputBorder(),
              ),
              onChanged: (newValue) {
                setState(() {
                  taskName = newValue;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Material(
              elevation: 5,
              color: Colors.lightBlueAccent,
              child: TextButton(
                onPressed: () {
                  widget.addTaskHandler(taskName);
                },
                child: const Text(
                  'add',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class AddTaskScreen extends StatelessWidget {
//   final List<Task> tasks;
//   AddTaskScreen({required this.tasks});
//
//   String taskName;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'add Task',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: Colors.lightBlueAccent,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 30),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//              TextField(
//               decoration: const InputDecoration(
//                 hintText: 'add task',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (newValue) {
//                 taskName = newValue;
//               },
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Material(
//               elevation: 5,
//               color: Colors.lightBlueAccent,
//               child: TextButton(
//                 onPressed: () {
//                   tasks.add(Task(name: taskName));
//                   print('taskname = $taskName');
//
//                 },
//                 child: const Text(
//                   'add',
//                   style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
