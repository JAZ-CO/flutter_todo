import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: this.taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //task name
              Text(
                this.taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
