import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_app/data/database.dart';
import 'package:workout_app/util/dialog_box.dart';
import 'package:workout_app/util/workout_tile.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key});

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  // Reference Hive Box Database
  final _mybox = Hive.box('mybox');
  WorkoutDataBase db = WorkoutDataBase();

  @override
  void initState() {
    // If first time openeing create deafult data
    if(_mybox.get("OTHERLIST") == null) {
      db.CreateInitialData();
    } else {
      db.loadDataOther();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();



  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.otherList[index][1] = !db.otherList[index][1];
    });
    db.updateDataOther();
  }

  //save new workout
  void saveNewWorkout() {
    setState(() {
      db.otherList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataOther();
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
      db.otherList.removeAt(index);
    });
    db.updateDataOther();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      /*appBar: AppBar(
        title: Text('Your Workout'),
        elevation: 0

      ),*/
      
      floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: Icon(Icons.add),
        
         ),
      body: ListView.builder(
        itemCount: db.otherList.length,
        itemBuilder: (context, index) {
          return WorkoutTile(
            workoutName: db.otherList[index][0], 
            workoutCompleted: db.otherList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteWorkout(index),
          );
        },
      ),

    );  
  }
}