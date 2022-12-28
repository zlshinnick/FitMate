import 'package:flutter/material.dart';
import 'package:workout_app/util/my_button.dart';

 class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: Container(
        height: 120, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         
          children: [
          // Get User Input
          TextField(
            controller: controller,
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Add a new workout"
              ),
          ),

          // buttons 
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              // save
              MyButton(text: "Save", onPressed: onSave),

              const SizedBox(width: 8),
              // cancel
              MyButton(text: "Cancel", onPressed: onCancel),
           ])
        ])
        )
    );
  }
}