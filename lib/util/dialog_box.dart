import 'package:flutter/material.dart';
import 'package:flutter_todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 200,
        width: 350,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: this.controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: "Enter your goal"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(name: "Cancel", onPressed: onCancel),
              const SizedBox(width: 10),
              MyButton(name: "Save", onPressed: onSave)
            ],
          )
        ]),
      ),
    );
  }
}
