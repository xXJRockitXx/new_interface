import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  double x;
  double y;
  double z;
  double miles;
  double duration;
  double calories;
  int steps;

  Data(this.x, this.y, this.z, this.miles, this.duration, this.calories,
      this.steps,
      {Key? key})
      : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador de pasos"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            "Pasos: ${widget.steps}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),

          SizedBox(
            height: 50,
          ),

          Text(
            "Calorias: ${widget.calories}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),

          SizedBox(
            height: 50,
          ),

          Text(
            "Km recorridos: ${widget.miles * 1.60934}",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      )),
    );
  }
}
