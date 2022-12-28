import 'package:hive_flutter/hive_flutter.dart';

class WorkoutDataBase {

  List workoutList = [];
  List runningList = [];
  // reference our box
  final _mybox = Hive.box('mybox');

  // First Time Openeing App
  void CreateInitialData() {
    workoutList = [
      ["Add new workout", false],
    ];

    runningList = [
      ["Add new run", false],
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

  void loadDataRunning() {
    runningList = _mybox.get("RUNNINGLIST");
  }

    // update the database
  void updateDataRunning() {
    _mybox.put("RUNNINGLIST", runningList);
  }

}