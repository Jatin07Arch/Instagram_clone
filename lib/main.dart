import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_login_ui/Instagram_login_main.dart';
import 'package:instagram_login_ui/Instagram_splash_screen.dart';
import 'package:instagram_login_ui/bottomnav/bottomnav.dart';
import 'package:instagram_login_ui/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firestore CRUD',
      debugShowCheckedModeBanner: false, // App title
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Set a primary color for the app
      ),
      home: SplashScreen(), // Set Home as the initial screen
    );
  }
}
