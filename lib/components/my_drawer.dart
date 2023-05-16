import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_interface/pages/login_page.dart';
import '../pages/setting_page.dart';
import '../pages/technical_service.dart';

/*

D R A W E R

This is the drawer which the user can open by tapping on the top left menu icon.

This drawer can hold many list tiles. Usually you would place the buttons/pages
that you couldn't fit on the bottom nav bar. 

For e.g. a logout button, an about section, etc.

What pages should the rest of the app contain? 

Remember, just having more and more pages isn't always a good thing.
Sometimes, it's better to be simple and concise in what your app does,
so you include only the absolutely necessary pages and functionality to your app!

*/

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  // method to log user out
  /*void logUserOut(BuildContext context) {
    // pop drawer
    Navigator.pop(context);
    // pop app
    Navigator.pop(context);
    // go back to login page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        children: [
          // Drawer header
          const DrawerHeader(
            child: Center(
              child: Icon(
                Icons.phone_iphone_rounded,
                size: 64,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // TECHNICAL PAGE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TechnicalPage(),
                  ),
                );
              },
              child: ListTile(
                leading: const Icon(Icons.info),
                title: Text(
                  "SERVICIO TÉCNICO",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ),
          ),

          // SETTINGS PAGE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ),
                );
              },
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  "A J U S T E S",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ),
          ),

          // LOGOUT BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              //onTap: () => logUserOut(context),
              onTap: () {FirebaseAuth.instance.signOut();},
              title: Text(
                "CERRAR SESIÓN",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
