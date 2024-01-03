import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List todoList = [
    ["Finish Flutter", true],
    ["Do exercise", false]
  ];
  //refference box
  final _myBox = Hive.box('myBox');

  //1st time list
  void createInitialData() {
    todoList = [
      ["Finish Flutter", true],
      ["Do exercise", false]
    ];
  }

  // load the data from db
  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  // updata data
  void updateDataBase() {
    _myBox.put("TODOLIST", this.todoList);
  }
}
