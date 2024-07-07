import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/db.dart';
import 'package:to_do_app/dialog_box.dart';
import 'package:to_do_app/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final addcontroller = TextEditingController();

  final mybox = Hive.box("mybox");

  dbDatabase db = dbDatabase();

  @override
  void initState() {
    if (mybox.get("TODOLIST") == null) {
      db.createInitalDate();
    } else {
      db.loadDate();
    }

    super.initState();
  }

  // List todoList = [
  //   ["Make Tutorial", false],
  //   ["Make Tutorial", false]
  // ];

  void checkboxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void createNewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
            controller: addcontroller,
            onCancel: () => Navigator.of(context).pop(),
            onsave: saveTask);
      },
    );
  }

  void saveTask() {
    setState(() {
      db.todoList.add(
        [addcontroller.text, false],
      );
      addcontroller.clear();
    });
    mybox.put("TODOLIST", db.todoList);
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewtask();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text("TO DO"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.yellow[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return todotile(
                  taskname: db.todoList[index][0],
                  taskcompleted: db.todoList[index][1],
                  onchanged: (value) => checkboxChange(value, index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
              itemCount: db.todoList.length,
            ),
          )
        ],
      ),
    );
  }
}
