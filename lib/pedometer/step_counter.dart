import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/local_storage.dart';
import 'data.dart';

class StepCounter extends StatefulWidget {
  const StepCounter({Key? key}) : super(key: key);

  @override
  State<StepCounter> createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = LocalStorage.prefs.getInt("preSteps") ?? 0;
  double previousDistacne = LocalStorage.prefs.getDouble("preValue") ?? 0.0;
  double distance = 0.0;

  //Stream stream = SensorsPlatform.instance.accelerometerEvents;
  Stream<AccelerometerEvent> stream =
      SensorsPlatform.instance.accelerometerEvents;

  double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistacne;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    //SharedPreferences _pref = await SharedPreferences.getInstance();
    //_pref.setDouble("preValue", distance);
    LocalStorage.prefs.setDouble("preValue", distance);
  }

  void getPreviousValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      //previousDistacne = _pref.getDouble("preValue") ?? 0.0;
      previousDistacne = LocalStorage.prefs.getDouble("preValue") ?? 0.0;
    });
  }

  // void calculate data
  double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: StreamBuilder<AccelerometerEvent>(
        stream: stream,
        builder: (context, snapShort) {
          if (snapShort.hasData) {
            x = snapShort.data!.x;
            y = snapShort.data!.y;
            z = snapShort.data!.z;
            distance = getValue(x, y, z);
            //if (distance >= 8) {
            if (distance >= 8) {
              steps++;
              LocalStorage.prefs.setInt("preSteps", steps);
            }
            calories = calculateCalories(steps);
            duration = calculateDuration(steps);
            miles = calculateMiles(steps);
          }
          //return Data(x,y,z,miles,duration,calories,steps);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Center(child: Text("Contador de pasos")),
            ),
            body: Center(
                child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),

                // PASOS
                Text(
                  "Pasos: ${double.parse((steps).toStringAsFixed(2))}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                // CALORIAS
                Text(
                  "Calorias: ${double.parse((calories).toStringAsFixed(2))}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                // KM RECORRIDOS
                Text(
                  "Km recorridos: ${double.parse((miles * 1.60934).toStringAsFixed(2))}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
