import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/adapters.dart';
import 'db/models/db_models.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void distanceMeasure() async {
  print('distancemeasure');
  double distance;
  List<NotifyModel> notifyList = [];

  await Hive.initFlutter();

  Future<List<NotifyModel>> getAllNotifybg() async {
    if (!Hive.isAdapterRegistered(NotifyModelAdapter().typeId)) {
      Hive.registerAdapter(NotifyModelAdapter());
    }
    final notifyBox = await Hive.openBox<NotifyModel>('notify_db');
    print(' notify db values ${notifyBox.values}');
    notifyList.clear();
    notifyList.addAll(notifyBox.values);
    return notifyList;

  }

  notifyList = await getAllNotifybg();
  print(notifyList);

  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  final currentPosition = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.best,
  );

  for (int i = 0; i < notifyList.length; i++) {
    double latitude = notifyList[i].latitude;
    double longitude = notifyList[i].longitude;
    distance = Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      latitude,
      longitude,
    );
    print(distance);
    if (notifyList[i].distance != null) {
      if (distance < 2000) {
        print('hihihi');
        await _showNotification(
          notifyList[i].location,
          notifyList[i].name,
          i.toString(),
        );
      }
    }
  }
}

Future<void> _showNotification(
  String location,
  String name,
  String notificationId,
) async {
  final uniqueId = sha1.convert(utf8.encode(location + name)).toString();

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id',
    'your_channel_name',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    uniqueId.hashCode,
    'Alarm',
    '$name... $location is less than 1000 meters!',
    platformChannelSpecifics,
    payload: notificationId,
  );
}

void backgroundTask() async {
  await AndroidAlarmManager.periodic(
    const Duration(minutes: 1),
    0,
    distanceMeasure,
    exact: true,
    wakeup: true,
  );
}
