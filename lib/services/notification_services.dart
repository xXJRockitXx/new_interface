import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings("icon");

  //Darwin for IOS
  const DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification(title, body) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails("channelId", "channelName",
          importance: Importance.max, priority: Priority.high);

  //Darwin for IOS
  const DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails();

  const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails, iOS: darwinNotificationDetails);

  await flutterLocalNotificationsPlugin.show(
      0, title, body, notificationDetails);
}
