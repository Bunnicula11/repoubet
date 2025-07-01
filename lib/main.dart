import 'package:flutter/material.dart';
import 'login_screen.dart'; // Make sure this file exists in lib/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EchoGuard',
      home: LoginScreen(), // <- This starts the app with your login page
    );
  }
}
