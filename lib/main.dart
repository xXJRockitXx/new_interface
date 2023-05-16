import 'dart:ffi';
import 'dart:math';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:new_interface/pages/setting_page.dart';
import 'package:new_interface/pedometer/on_off_step.dart';
import 'package:new_interface/pedometer/pedometer.dart';
import 'package:new_interface/services/local_storage.dart';
import 'package:new_interface/services/notification_services.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'auth/main_page.dart';
import 'modules/modules.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalStorage.configurePrefs();
  await initNotifications();
  await initservice();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

Future<void> initservice() async {
  var service = FlutterBackgroundService();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "notificationChannelId", // id
    'MY FOREGROUND SERVICE', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  //service init and start
  await service.configure(
      iosConfiguration:
          IosConfiguration(onBackground: iosBackground, onForeground: onStart),
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: false,
        isForegroundMode: true,
      ));
  //service.startService();
  //for ios enable background fetch from add capability inside background mode
}

//onstart method
@pragma("vm:enry-point")
void onStart(ServiceInstance service) {
  // ACCELEROMETER
  accelerometerEvents.listen((AccelerometerEvent event) {
    print(event);
  });

  DartPluginRegistrant.ensureInitialized();

  service.on("setAsForeground").listen((event) {
    print("foreground ===============");
  });

  service.on("setAsBackground").listen((event) {
    print("background ===============");
  });

  service.on("stopService").listen((event) {
    service.stopSelf();
  });

  print("Background service ${DateTime.now()}");
}

//iosbackground
@pragma("vm:enry-point")
Future<bool> iosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // this is bringing us to the LoginPage first
      initialRoute: "/",
      routes: {
        "/": (context) => const MainPage(),
        "/module_1": (context) => const Module_1(),
        "/module_2": (context) => const Module_2(),
        "/module_3": (context) => const SettingPage(),
        //"/video_screen": (context) => const VideoScreen(),
        "/on_off": (context) => const OnOffStepCounter(),
      },
    );
  }
}