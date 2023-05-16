import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class OnOffStepCounter extends StatefulWidget {
  const OnOffStepCounter({Key? key}) : super(key: key);

  @override
  State<OnOffStepCounter> createState() => _OnOffStepCounterState();
}

class _OnOffStepCounterState extends State<OnOffStepCounter> {

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
                child: Text("Dejar de contar")),
            ElevatedButton(
                onPressed: () {
                  FlutterBackgroundService().startService();
                },
                child: Text("Contar")),
          ],
        ),
      ),
    );
  }
}
