import 'package:hive_flutter/hive_flutter.dart';

class dbDatabase {
  List todoList = [];

  final mybox = Hive.box("mybox");

  void createInitalDate() {
    todoList = [
      ["my tutorial", false],
      ["Do exercise", false],
    ];
  }

  void loadDate() {
    todoList = mybox.get("TODOLIST");
  }

  void updateData() {
    mybox.put("TODOLIST", todoList);
  }
}
