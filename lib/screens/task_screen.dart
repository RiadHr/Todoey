import 'package:flutter/material.dart';
import 'package:todey3_flutter/screens/add_task_screen.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  static String id = 'TaskScreen';

  final List<Task> tasks;
  TaskScreen({required this.tasks});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Widget bottomSheetHandler(BuildContext context) => AddTaskScreen(
    addTaskHandler: (taskName){
        setState(() {
          widget.tasks.add(Task(name: taskName));
        });
        print('taskname = $taskName');
  });


  // List<Task> tasks =[
  //   Task(name: 'buy milk'),
  //   Task(name: 'buy eggs')
  // ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return bottomSheetHandler(context);
              },
            );
          },
          child: Icon(Icons.add)),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '12 task',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TaskList(
                  tasks: widget.tasks,checkboxCallback: (value, int index) {
                      setState(() {
                        widget.tasks[index].toggleDone();
                      });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
