import 'package:hive_flutter/hive_flutter.dart';

class AppDataBase {

  List workoutList = [];
  List runningList = [];
  List otherList = [];
  List mealList = [];
  List goalList = [];
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


    runningList = [
      ["Add new excersice", false],
    ];

    runningList = [
      ["Add a meal", false],
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

  void updateDataRunning() {
    _mybox.put("RUNNINGLIST", runningList);
  }

  void loadDataOther() {
    otherList = _mybox.get("OTHERLIST");
  }

  void updateDataOther() {
    _mybox.put("OTHERLIST", otherList);
  }

  void loadDataMeal() {
    mealList = _mybox.get("MEALLIST");
  }

  void updateDataMeal() {
    _mybox.put("MEALLIST", mealList);
  }

  void loadDataGoal() {
    goalList = _mybox.get("GOALLIST");
  }

  void updateDataGoal() {
    _mybox.put("GOALLIST", goalList);
  }
}