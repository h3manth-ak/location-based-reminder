

import 'package:hive_flutter/adapters.dart';
part 'db_models.g.dart';



@HiveType(typeId:1)
class TaskModel{
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String task;
  @HiveField(2)
  final String location;
  bool isOn=true;
  bool isVisible=false;
  TaskModel({required this.task, required this.location,this.id});
}

@HiveType(typeId:2)
class NotifyModel{
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String distance;
  @HiveField(3)
  final String location;
  bool isOn=true;
  bool isVisible=false;
  NotifyModel({required this.name,required this.distance,required this.location,this.id});
}