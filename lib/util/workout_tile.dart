import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutTile  extends StatelessWidget{
  final bool workoutCompleted;
  final String workoutName;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  WorkoutTile({
    super.key, 
    required this.workoutName,
    required this.workoutCompleted ,
    required this.onChanged,
    required this.deleteFunction, 
    });
  

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
              )]
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // CheckBox
              Checkbox(
                value: workoutCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
      
              // Workout Name
              Text(
                workoutName,
                style: TextStyle(decoration: workoutCompleted ? TextDecoration.lineThrough : TextDecoration.none),
                ), 
            ],
          ),
        ),
      ),
    );
  }
}