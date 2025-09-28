import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var flp = FlutterLocalNotificationsPlugin();

  Future<void> setup() async{
    var androidSetting = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosSetting = const DarwinInitializationSettings();
    var setupSetting = InitializationSettings(android: androidSetting, iOS: iosSetting);
    await flp.initialize(setupSetting, onDidReceiveNotificationResponse: chosenNotification);
  }

  Future<void> chosenNotification(NotificationResponse notificationResponse) async{
    var payload = notificationResponse.payload;
    if(payload != null){
      print("Notification is selected: $payload");
    }
  }

  Future<void> showNotification() async{
    // Android 13+ runtime notification izni
    if (Platform.isAndroid) {
      await flp
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }

    var androidNotificationDetail = const AndroidNotificationDetails(
        "channelId",
        "channelTitle",
        channelDescription: "channel description",
        priority: Priority.high,
        importance: Importance.max
    );

    var iosNotificationDetail = const DarwinNotificationDetails();

    var notificationDetail = NotificationDetails(android: androidNotificationDetail, iOS: iosNotificationDetail);

    await flp.show(0, "title", "content", notificationDetail, payload: "Payload content");
  }

  Future<void> showNotificationWithDelay() async {
    if (Platform.isAndroid) {
      final androidImplementation =
      flp.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      await androidImplementation?.requestNotificationsPermission();
    }

    var androidNotificationDetail = const AndroidNotificationDetails(
        "channelId",
        "channelTitle",
        channelDescription: "channel description",
        importance: Importance.max,
        priority: Priority.high
    );

    var iosNotificationDetail = const DarwinNotificationDetails();

    var notificationDetail = NotificationDetails(
        android: androidNotificationDetail, iOS: iosNotificationDetail);

    tz.initializeTimeZones();

    var delay = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 10));

    await flp.zonedSchedule(
      0,
      "Delayed Title",
      "Delayed Content",
      delay,
      notificationDetail,
      androidScheduleMode: AndroidScheduleMode.inexact,
    );
  }

  @override
  void initState() {
    super.initState();

    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Notification Usage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: (){
                  showNotification();
                },
                child: Text("Create Notification"),
            ),
            ElevatedButton(
              onPressed: (){
                showNotificationWithDelay();
              },
              child: Text("Create Notification with Delay"),
            ),
          ],
        ),
      ),
    );
  }
}
