import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:location_based_reminder/Screens/Notify/notify_data.dart';
// import 'package:location_based_reminder/Notify/notify_page.dart';
// import 'package:location_based_reminder/Reminder/reminder.dart';
import 'package:location_based_reminder/Screens/Notify/notify_page.dart';
import 'package:location_based_reminder/Screens/Reminder/reminder.dart';
import 'package:location_based_reminder/Screens/home/screen_home.dart';
import 'package:location_based_reminder/db/models/db_models.dart';

import 'Screens/Reminder/input_data.dart';
// import 'package:location_based_reminder/home/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if(!Hive.isAdapterRegistered(TaskModelAdapter().typeId)){
    Hive.registerAdapter(TaskModelAdapter());
  }
  if(!Hive.isAdapterRegistered(NotifyModelAdapter().typeId)){
    Hive.registerAdapter(NotifyModelAdapter());
  }
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
        filled: true, //<-- SEE HERE
        fillColor: Colors.grey, //<-- SEE HERE
        ),
      ),
      
      home:HomeScreen() ,
      routes:{
        'notify_home':(ctx){
          return Notify();
        },
        'reminder_home':(ctx){
          return Reminder();
        },
        'reminder_data':(ctx){
          return IpFormField();
        },
        'notify-data':(ctx){
          return NotifyInput();
        }
      } ,
    );
  }
}


