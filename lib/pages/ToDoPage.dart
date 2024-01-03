import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/data/database.dart';
import 'package:flutter_todo/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  void initState() {
    //if its 1st time ever
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // task controller add
  final _controller = TextEditingController();
  void onSave() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.text = "";
    });
    db.updateDataBase();
  }

  //task complete

  void checkBoxChanged(bool? value, int index) {
    {
      setState(() {
        db.todoList[index][1] = !db.todoList[index][1];
      });
      db.updateDataBase();
    }
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: onSave,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

// delte task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
