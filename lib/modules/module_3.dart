import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class Module_3 extends StatefulWidget {
  const Module_3({Key? key}) : super(key: key);

  @override
  State<Module_3> createState() => _Module_3State();
}

class _Module_3State extends State<Module_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MAGIA"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //layout
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
                onPressed: () {
                  FlutterBackgroundService().invoke("stopService");
                },
                child: Text("stop service")),
            ElevatedButton(
                onPressed: () {
                  FlutterBackgroundService().startService();
                },
                child: Text("start service")),
          ],
        ),
      ),
    );
  }
}
