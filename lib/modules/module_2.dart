import 'package:flutter/material.dart';
import 'package:new_interface/modules/modules.dart';

class Module_2 extends StatefulWidget {
  const Module_2({Key? key}) : super(key: key);

  @override
  State<Module_2> createState() => _Module_2State();
}

//

class _Module_2State extends State<Module_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Bienvenido al módulo 2",
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
                              "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_2%2Foshi.mp4?alt=media&token=98f2afac-b6c2-409c-b0d9-9dcd80fec334")));
                  /*Navigator.pushNamed(context, "/video_screen",
                      arguments: WidgetArguments(
                          "https://firebasestorage.googleapis.com/v0/b/demos-d97a5.appspot.com/o/Modulo_2%2Foshi.mp4?alt=media&token=98f2afac-b6c2-409c-b0d9-9dcd80fec334"));*/
                },
                child: const Text("Video")),
          ],
        )));
  }
}
