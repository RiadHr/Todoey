import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey3_flutter/screens/add_task_screen.dart';
import '../models/task.dart';
import '../models/task_data.dart';
import '../widgets/task_list.dart';

class TaskScreen extends StatefulWidget {
  static String id = 'TaskScreen';

  // final List<Task> tasks;
  // TaskScreen({required this.tasks});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Widget bottomSheetHandler(BuildContext context) =>
      AddTaskScreen(addTaskHandler: (taskName) {
        setState(() {
          Provider.of<TaskData>(context, listen: false)
              .addTask(Task(name: taskName));
          Navigator.pop(context);
        });
        print('taskname = $taskName');
      });

  // List<Task> tasks =[
  //   Task(name: 'buy milk'),
  //   Task(name: 'buy eggs')
  // ];

  @override
  Widget build(BuildContext context) {
    List<Task> providedTasks = Provider.of<TaskData>(context).tasks;
    int? taskElement;
    if (providedTasks.length != null) {
      taskElement = providedTasks.length;
    }

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
          child: const Icon(Icons.add)),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${taskElement} task',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
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
                  checkboxCallback: (bool value, int index) {
                    setState(
                      () {
                        providedTasks[index].toggleDone();
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
