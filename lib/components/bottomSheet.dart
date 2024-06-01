import 'package:flutter/material.dart';

class Bottom_Sheet extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  Bottom_Sheet({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      shadowColor: Colors.blueAccent,
      elevation: 10,
      content: Container(
        height: 150,
        color: Colors.transparent,
        child: Column(
          children: [
            TextField(
              controller: controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hoverColor: Colors.blueAccent,
                hintText: "Enter the task...",
                hintStyle: TextStyle(color: Colors.blueAccent),
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: onSave,
                      child: Text("Save"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(),
                  ),
                  ElevatedButton(
                      onPressed: onCancel,
                      child: Text("Exit")
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
    }
}
