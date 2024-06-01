import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/Database/db.dart';
import '../components/tiles.dart';
import '../components/bottomSheet.dart';

class Home extends StatefulWidget {


  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _myBox = Hive.box("myBox");
  todoDb db = new todoDb();

  @override
  void initState() {
    // TODO: implement initState
    if(_myBox.get("TODOLIST") == null) {
      db.CreateDb();
    }
    else {
      db.loadDb();
    }
  }

  final _controller = TextEditingController();


  checkboxClicked(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
  }

  onSaveFuntion() {
    if(_controller != Null){
      setState(() {
        db.todoList.add([_controller.text, false]);
      });
      db.updateDb();
      Navigator.of(context).pop();
    }
    else {
      return;
    }
  }

  createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Bottom_Sheet(
          controller: _controller,
          onSave: onSaveFuntion,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  deleteFuntion(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateDb();
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "To Do App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: createNewTask, // Corrected onPressed
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index){
          return Tile(
            name: db.todoList[index][0],
            isCompleted: db.todoList[index][1],
            onChanged: (value) => checkboxClicked(value, index),
            deleteFunction: (context) => deleteFuntion(index),
          );
        },
      ),
    );
  }
}
