import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:new_interface/modules/modules.dart';


class Module_1 extends StatefulWidget {
  const Module_1({Key? key}) : super(key: key);

  @override
  State<Module_1> createState() => _Module_1State();
}

class _Module_1State extends State<Module_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Bienvenido al módulo 1",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoScreen(
                              "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_1%2Fplaya.mp4?alt=media&token=6c3e8c9a-f53b-45d9-ac93-d96feeda7ad2")));
                  /*Navigator.pushNamed(context, "/video_screen",
                      arguments: WidgetArguments(
                          "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_1%2Fplaya.mp4?alt=media&token=6c3e8c9a-f53b-45d9-ac93-d96feeda7ad2"));*/
                },
                child: const Text("Video")),
          ],
        )));
  }
}
