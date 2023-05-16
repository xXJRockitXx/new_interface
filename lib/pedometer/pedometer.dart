import 'dart:math';
import 'package:new_interface/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*double x = 0.0;
double y = 0.0;
double z = 0.0;
double miles = 0.0;
double duration = 0.0;
double calories = 0.0;
double addValue = 0.025;
int steps = 0;
double previousDistacne = 0.0;
double distance = 0.0;*/

class Pedometer {
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double miles = 0.0;
  double duration = 0.0;
  double calories = 0.0;
  double addValue = 0.025;
  int steps = LocalStorage.prefs.getInt("preSteps") ?? 0;
  static double previousDistacne = LocalStorage.prefs.getDouble("preValue") ?? 0.0;
  double distance = 0.0;

  // CALCULOS PARA FISICA
  static double getValue(double x, double y, double z) {
  //double getValue(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviousValue();
    double modDistance = magnitude - previousDistacne;
    setPreviousValue(magnitude);
    return modDistance;
  }

  static void setPreviousValue(double distance) async {
    //SharedPreferences _pref = await SharedPreferences.getInstance();
    //_pref.setDouble("preValue", distance);
    LocalStorage.prefs.setDouble("preValue", distance);
  }

  static void getPreviousValue() async {
    //SharedPreferences _pref = await SharedPreferences.getInstance();
    //previousDistacne = _pref.getDouble("preValue") ?? 0.0;
    previousDistacne = LocalStorage.prefs.getDouble("preValue") ?? 0.0;
  }

// void calculate data
  static double calculateMiles(int steps) {
    double milesValue = (2.2 * steps) / 5280;
    return milesValue;
  }

  double calculateDuration(int steps) {
    double durationValue = (steps * 1 / 1000);
    return durationValue;
  }

  static double calculateCalories(int steps) {
    double caloriesValue = (steps * 0.0566);
    return caloriesValue;
  }
}
