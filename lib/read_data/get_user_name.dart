import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    //Obtener la collecion
    CollectionReference users =
        FirebaseFirestore.instance.collection("usuarios");

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("${data["nombre"]}" +
              " ${data["apellido"]}," +
              " ${data["edad"]} años");
        }
        return Text("Cargando...");
      }),
    );
  }
}
