import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailControl = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailControl.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailControl.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              //content: Text(e.message.toString()),
              content: Text("Correo de recuperación enviado"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              //content: Text(e.message.toString()),
              content: Text("Correo inexistente"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Ingresa tu correo y te enviaremos un link para cambiar tu contraseña",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          //Email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: _emailControl,
                  decoration: InputDecoration(
                      hintText: "Correo", border: InputBorder.none),
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          MaterialButton(
            onPressed: passwordReset,
            child: Text("Restablecer contraseña"),
            color: Colors.deepPurple[200],
          )
        ],
      ),
    );
  }
}
