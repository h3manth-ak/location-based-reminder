import 'package:flutter/material.dart';
import '../models/db_models.dart';

ValueNotifier<List<TaskModel>>taskListNotifier=ValueNotifier([]);
ValueNotifier<List<NotifyModel>>notifyListNotifier=ValueNotifier([]);

void addTask(TaskModel task){
  taskListNotifier.value.add(task);
  taskListNotifier.notifyListeners();
  print(task.toString());

}
void addNotify(NotifyModel notify){
  notifyListNotifier.value.add(notify);
  notifyListNotifier.notifyListeners();
  print(notify.toString());

}