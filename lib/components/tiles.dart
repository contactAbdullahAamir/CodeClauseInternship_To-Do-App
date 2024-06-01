import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Tile extends StatelessWidget {
  final String name;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  void Function(BuildContext)? deleteFunction;
  Tile({super.key, required this.name, required this.isCompleted, required this.onChanged, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction, icon: Icons.delete_outline, backgroundColor: Colors.redAccent, borderRadius: BorderRadius.circular(20),)
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // CheckBox
                Checkbox(value: isCompleted, onChanged: onChanged, activeColor: Colors.blueAccent,),
                // Name
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
