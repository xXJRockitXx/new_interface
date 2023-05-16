import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:new_interface/read_data/get_user_name.dart';
import 'package:new_interface/services/notification_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  String? mtoken = " ";

  //IDs
  List<String> docIDs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
    //getToken();
    initInfo();
  }

  //Firebase Messages
  initInfo() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      //print("onmessage: ${message.notification?.title}/${message.notification?.body}");
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContentTitle: true);

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails("dbfood", "dbfood",
              importance: Importance.max,
              styleInformation: bigTextStyleInformation,
              priority: Priority.max,
              playSound: true);

      //Darwin for IOS
      const darwinNotificationDetails =
          DarwinNotificationDetails(presentSound: true);

      NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: darwinNotificationDetails);

      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics,
          payload: message.data["body"]);
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission();
  }

  //Obtener IDs
  Future getDocIDs() async {
    /*showNotification(
        "Titulo", "Probando notificaciones");*/ //Mostramos notificacion
    docIDs.clear(); //Evita que se dupliquen cada HotReload xd

    await FirebaseFirestore.instance
        .collection("usuarios")
        .orderBy("edad", descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (element) {
              print(element.reference);
              docIDs.add(element.reference.id);
            },
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),

          // MODULO 1
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/module_1",
                );
              },
              child: const Text("Módulo 1")),

          // MODULO 2
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/module_2",
                );
              },
              child: const Text("Módulo 2")),

          // BACKGROUND
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/on_off");
              },
              child: const Text("Background")),

          // DATOS
          Expanded(
            child: FutureBuilder(
              future: getDocIDs(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: GetUserName(
                            documentId: docIDs[index],
                          ),
                          tileColor: Colors.grey[200],
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      )),
    );
  }
}
