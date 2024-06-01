import 'package:hive_flutter/hive_flutter.dart';

class todoDb {
  List todoList = [];
  final _myBox = Hive.box("myBox");

  void CreateDb() {
    todoList = [
      ["This is dummy Data", false],
    ];
  }

  void loadDb() {
    todoList = _myBox.get("TODOLIST");
  }

  void updateDb() {
    _myBox.put("TODOLIST", todoList);
  }
}