import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TodoPage(),
    );
  }
}

class Task {
  String title;
  bool isCompleted;

  Task({
    required this.title,
    this.isCompleted = false,
  });
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  final TextEditingController taskController =
      TextEditingController();

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),

      body: Column(
        children: [

          TextField(
            controller: taskController,
            decoration: const InputDecoration(
              hintText: 'Enter a task',
            ),
          ),

          ElevatedButton(
            onPressed: () {
              setState(() {
                tasks.add(
                  Task(title: taskController.text),
                );
              });

              taskController.clear();
            },
            child: const Text('ADD'),
          ),

          for (Task task in tasks)
            Row(
              children: [
                Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    setState(() {
                      task.isCompleted = value!;
                    });
                  },
                ),
                Text(task.title),
              ],
            ),
        ],
      ),
    );
  }
}