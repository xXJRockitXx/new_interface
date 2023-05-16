import 'package:flutter/material.dart';

/*

A B O U T P A G E

This is the AboutPage. This is usually a static page that displays lots of text
describing what your app/business does.

This is also a great place to give the user a link or email that they can use 
to give any feedback about the app.

*/

class TechnicalPage extends StatelessWidget {
  const TechnicalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Text(
          'SERVICIO TÉCNICO',
          style: TextStyle(color: Colors.grey[800]),
        ),
      ),
      body: const Center(
          child: Text(
              'Hola, envía un correo con una breve descripción de los sucedido y una captura de pantalla..')),
    );
  }
}
