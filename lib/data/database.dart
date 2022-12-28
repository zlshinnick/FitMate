import 'package:hive_flutter/hive_flutter.dart';

class WorkoutDataBase {

  List workoutList = [];

  // reference our box
  final _mybox = Hive.box('mybox');

  // First Time Openeing App
  void CreateInitialData() {
    workoutList = [
      ["Add new workout", false],
    ];
  }

  // load data from database
  void loadData() {
    workoutList = _mybox.get("WORKOUTLIST");
  }

  // update the database
  void updateData() {
    _mybox.put("WORKOUTLIST", workoutList);
  }
}