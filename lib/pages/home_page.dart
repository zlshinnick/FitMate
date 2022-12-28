import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_app/data/database.dart';
import 'package:workout_app/util/dialog_box.dart';
import 'package:workout_app/util/workout_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Reference Hive Box Database
  final _mybox = Hive.box('mybox');
  WorkoutDataBase db = WorkoutDataBase();

  @override
  void initState() {
    // If first time openeing create deafult data
    if(_mybox.get("WORKOUTLIST") == null) {
      db.CreateInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();



  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.workoutList[index][1] = !db.workoutList[index][1];
    });
    db.updateData();
  }

  //save new workout
  void saveNewWorkout() {
    setState(() {
      db.workoutList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // Create a New Workout
  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewWorkout,
          onCancel:() => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteWorkout(int index) {
    setState(() {
      db.workoutList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('Workouts'),
        elevation: 0

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: Icon(Icons.add),
        
         ),
      body: ListView.builder(
        itemCount: db.workoutList.length,
        itemBuilder: (context, index) {
          return WorkoutTile(
            workoutName: db.workoutList[index][0], 
            workoutCompleted: db.workoutList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteWorkout(index),
          );
        },
      ),

    );  
  }
}