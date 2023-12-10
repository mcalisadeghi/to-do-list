import 'package:flutter/material.dart';
import 'package:flutter_application_1/ultil/dialog_box.dart';
import 'package:flutter_application_1/ultil/todo_tile.dart';
import 'package:hive/hive.dart';

class ToDoList extends StatefulWidget {
  // reference the hive box
  final _myBox = Hive.openBox(
    'myBox',
  );
  ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final _controller = TextEditingController();
  // list of todo tasks
  List toDoList = [
    [
      'make Tutorial',
      false,
    ],
    [
      'Do Exercise',
      false,
    ],
  ];
  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(
      () {
        toDoList[index][1] = !toDoList[index][1];
      },
    );
  }

  void saveNewTask() {
    setState(
      () {
        toDoList.add([_controller.text, false]);
        _controller.clear();
      },
    );
    Navigator.of(context).pop();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text(
          'TO DO',
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (bool? value) => checkBoxChanged(
              value,
              index,
            ),
            deleteFuction: (BuildContext? context) => deleteTask(index),
          );
        },
        itemCount: toDoList.length, //1:42
      ),
    );
  }
}
