import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_app/data/database.dart';
import 'package:workout_app/util/dialog_box.dart';
import 'package:workout_app/util/workout_tile.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  // Reference Hive Box Database
  final _mybox = Hive.box('mybox');
  AppDataBase db = AppDataBase();

  @override
  void initState() {
    // If first time openeing create deafult data
    if(_mybox.get("MEALLIST") == null) {
      db.CreateInitialData();
    } else {
      db.loadDataMeal();
    }

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();



  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.mealList[index][1] = !db.mealList[index][1];
    });
    db.updateDataMeal();
  }

  //save new meal
  void saveNewMeal() {
    setState(() {
      db.mealList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataMeal();
  }

  // Create a New Meal
  void createNewMeal() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewMeal,
          onCancel:() => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteMeal(int index) {
    setState(() {
      db.mealList.removeAt(index);
    });
    db.updateDataMeal();
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
          onPressed: createNewMeal,
          child: Icon(Icons.add),
        
         ),
      body: ListView.builder(
        itemCount: db.mealList.length,
        itemBuilder: (context, index) {
          return WorkoutTile(
            workoutName: db.mealList[index][0], 
            workoutCompleted: db.mealList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteMeal(index),
          );
        },
      ),

    );  
  }
}