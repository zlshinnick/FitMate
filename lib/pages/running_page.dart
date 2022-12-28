import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_app/data/database.dart';
import 'package:workout_app/util/dialog_box.dart';
import 'package:workout_app/util/workout_tile.dart';

class RunningPage extends StatefulWidget {
  const RunningPage({super.key});

  @override
  State<RunningPage> createState() => _RunningPageState();
}

class _RunningPageState extends State<RunningPage> {
  // Reference Hive Box Database
  final _mybox = Hive.box('mybox');
  AppDataBase db = AppDataBase();

  @override
  void initState() {
    // If first time openeing create deafult data
    if(_mybox.get("RUNNINGLIST") == null) {
      db.CreateInitialData();
    } else {
      db.loadDataRunning();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();



  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.runningList[index][1] = !db.runningList[index][1];
    });
    db.updateDataRunning();
  }

  //save new workout
  void saveNewWorkout() {
    setState(() {
      db.runningList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataRunning();
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
      db.runningList.removeAt(index);
    });
    db.updateDataRunning();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      /*appBar: AppBar(
        title: Text('Your Workout'),
        elevation: 0

      ),*/
      
      floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: Icon(Icons.add),
        
         ),
      body: ListView.builder(
        itemCount: db.runningList.length,
        itemBuilder: (context, index) {
          return WorkoutTile(
            workoutName: db.runningList[index][0], 
            workoutCompleted: db.runningList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteWorkout(index),
          );
        },
      ),

    );  
  }
}