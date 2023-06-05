
import 'package:flutter/material.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
  // Register the headlessTask function
  BackgroundFetch.registerHeadlessTask(headlessTask);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Background Geolocation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Background Geolocation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Configure the background fetch plugin
  void configureBackgroundFetch() async {
    BackgroundFetch.configure(
        BackgroundFetchConfig(
          minimumFetchInterval: 15,
          stopOnTerminate: false,
          enableHeadless: true,
          requiresBatteryNotLow: false,
          requiresCharging: false,
          requiresStorageNotLow: false,
          requiresDeviceIdle: false,
          requiredNetworkType: NetworkType.NONE,
        ), (String taskId) async {
      // This is the fetch-event callback.
      print("[BackgroundFetch] Event received $taskId");
      // Get the current position and do something with it
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print("Current position is $position");
      // IMPORTANT: You must signal completion of your fetch task or the OS can punish your app
      // for taking too long in the background.
      BackgroundFetch.finish(taskId);
    }).then((int status) {
      print('[BackgroundFetch] configure success: $status');
    }).catchError((e) {
      print('[BackgroundFetch] configure ERROR: $e');
    });
  }

  @override
  void initState() {
    super.initState();
    // Request location permission and configure background fetch
    Geolocator.requestPermission().then((value) {
      if (value == LocationPermission.always || value == LocationPermission.whileInUse) {
        configureBackgroundFetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text('This app runs geolocator.currentposition() in background when not open.'),
      ),
    );
  }
}

// This is the headlessTask function that will run when app is terminated
void headlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    // This task has exceeded its allowed running-time.
    // You must stop what you're doing and immediately .finish(taskId)
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }
  print('[BackgroundFetch] Headless event received.');
  // Get the current position and do something with it
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  print("Current position is $position");
  // IMPORTANT: You must signal completion of your fetch task or the OS can punish your app
  // for taking too long in the background.
  BackgroundFetch.finish(taskId);
}