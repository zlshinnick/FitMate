import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_app/data/database.dart';
import 'package:workout_app/util/dialog_box.dart';
import 'package:workout_app/util/workout_tile.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  // Reference Hive Box Database
  final _mybox = Hive.box('mybox');
  AppDataBase db = AppDataBase();

  @override
  void initState() {
    // If first time openeing create deafult data
    if(_mybox.get("GOALLIST") == null) {
      db.CreateInitialData();
    } else {
      db.loadDataGoal();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();



  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.goalList[index][1] = !db.goalList[index][1];
    });
    db.updateDataGoal();
  }

  //save new workout
  void saveNewGOal() {
    setState(() {
      db.goalList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataGoal();
  }

  // Create a New Workout
  void createNewGoal() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewGOal,
          onCancel:() => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteGoal(int index) {
    setState(() {
      db.goalList.removeAt(index);
    });
    db.updateDataGoal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepPurpleAccent[100],

      
      floatingActionButton: FloatingActionButton(
          onPressed: createNewGoal,
          child: Icon(Icons.add),
        
         ),
      body: ListView.builder(
        itemCount: db.goalList.length,
        itemBuilder: (context, index) {
          return WorkoutTile(
            workoutName: db.goalList[index][0], 
            workoutCompleted: db.goalList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteGoal(index),
          );
        },
      ),

    );  
  }
}